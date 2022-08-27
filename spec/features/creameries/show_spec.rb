require 'rails_helper'

RSpec.describe Creamery, type: :feature do
    it 'displays one creamery with attributes' do
        creamery = Creamery.create!(name: "Jasper Hill Farm", date_founded: 2000, owner: "Mateo and Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
        #creamery2 = Creamery.create!(name: "Test 2 Name", date_founded: 2010, owner: "Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
        #creamery3 = Creamery.create!(name: "Test 3 Name", date_founded: 2015, owner: "Mateo", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")

        visit "/creameries/#{creamery.id}"

        expect(page).to have_content(creamery.name)
        expect(page).to have_content(creamery.date_founded)
        expect(page).to have_content(creamery.owner)
        expect(page).to have_content(creamery.head_cheesemaker)
        expect(page).to have_content(creamery.location)
        expect(page).to have_content(creamery.farmstead)
        expect(page).to have_content(creamery.acreage)
        expect(page).to have_content(creamery.awards_won)
    end
end