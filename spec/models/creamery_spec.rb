require 'rails_helper'

RSpec.describe Creamery, type: :model do
    describe "activerecord" do
        it 'displays creameries by date created in ascending order' do
            Creamery.destroy_all
            creamery = Creamery.create!(name: "Jasper Hill Farm", date_founded: 2000, owner: "Mateo and Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
            creamery2 = Creamery.create!(name: "Point Reyes", date_founded: 2000, owner: "Bob", head_cheesemaker: "Koob", location: "CA", farmstead: true, acreage: 100, awards_won: "All of them")

            expect(Creamery.ordered).to eq([creamery, creamery2])
        end
    end
end