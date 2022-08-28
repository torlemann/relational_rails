require 'rails_helper'

RSpec.describe Creamery, type: :model do
    describe "activerecord" do
        it 'orders creameries by date created in ascending order' do
            Creamery.destroy_all
            creamery = Creamery.create!(name: "Jasper Hill Farm", date_founded: 2000, owner: "Mateo and Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
            creamery2 = Creamery.create!(name: "Point Reyes", date_founded: 2000, owner: "Bob", head_cheesemaker: "Koob", location: "CA", farmstead: true, acreage: 100, awards_won: "All of them")
            
            expect(Creamery.ordered).to eq([creamery, creamery2])
        end

        it "counts how many cheeses the creamery makes" do
            Creamery.destroy_all
            creamery = Creamery.create!(name: "Jasper Hill Farm", date_founded: 2000, owner: "Mateo and Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
            cheese = creamery.cheeses.create!(name: "Winnimere", style: "washed", net_wt: 1.0, milk_type: "cow", veg_rennet: false, raw: true)
            cheese2 = creamery.cheeses.create!(name: "Bayley Hazen Blue", style: "blue-veined", net_wt: 7.0, milk_type: "cow", veg_rennet: false, raw: true)

            expect(creamery.cheeses.all.count).to eq(2)
          end
    end
end