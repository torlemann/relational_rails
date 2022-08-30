require 'rails_helper'

RSpec.describe Cheese, type: :model do
    describe 'true records' do
        it 'only shows vegetarian cheeses' do
            Creamery.destroy_all
            creamery = Creamery.create!(name: "Jasper Hill Farm", date_founded: 2000, owner: "Mateo and Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
            cheese = creamery.cheeses.create!(name: "Winnimere", style: "washed", net_wt: 1.0, milk_type: "cow", veg_rennet: false, raw: true)
            cheese2 = creamery.cheeses.create!(name: "Bayley Hazen Blue", style: "blue-veined", net_wt: 7.0, milk_type: "cow", veg_rennet: true, raw: true)

            expect(Cheese.veg_rennet).to eq([cheese2])
        end
    end

    describe 'alphabetical order' do
        Creamery.destroy_all
        Cheese.destroy_all
        it "sort cheeses alphabetically by name" do
            creamery = Creamery.create!(name: "Jasper Hill Farm", date_founded: 2000, owner: "Mateo and Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
            cheese = creamery.cheeses.create!(name: "Winnimere", style: "washed", net_wt: 1.0, milk_type: "cow", veg_rennet: false, raw: true)
            cheese2 = creamery.cheeses.create!(name: "Bayley Hazen Blue", style: "blue-veined", net_wt: 7.0, milk_type: "cow", veg_rennet: true, raw: true)

            expect(Cheese.alphabetize).to eq([cheese2, cheese])
        end
    end
end