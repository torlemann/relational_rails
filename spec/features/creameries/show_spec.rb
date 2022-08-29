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

    it "takes you back to cheese index" do
        creamery = Creamery.create!(name: "Jasper Hill Farm", date_founded: 2000, owner: "Mateo and Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
        cheese = creamery.cheeses.create!(name: "Winnimere", style: "washed", net_wt: 1.0, milk_type: "cow", veg_rennet: false, raw: true)
        visit "/creameries/#{creamery.id}"
        expect(page).to have_link("Cheeses")
        click_link 'Cheeses'
        expect(current_path).to eq('/cheeses')
    end

    it "takes you back to creamery index" do
        creamery = Creamery.create!(name: "Jasper Hill Farm", date_founded: 2000, owner: "Mateo and Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
        cheese = creamery.cheeses.create!(name: "Winnimere", style: "washed", net_wt: 1.0, milk_type: "cow", veg_rennet: false, raw: true)
        visit "/cheeses/#{cheese.id}"
        expect(page).to have_link("Creamery Index")
        click_link 'Creamery Index'
        expect(current_path).to eq('/creameries')
    end

    it "takes you back to cheeses of creamery index" do
        creamery = Creamery.create!(name: "Jasper Hill Farm", date_founded: 2000, owner: "Mateo and Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
        
        visit "/creameries/#{creamery.id}"
        expect(page).to have_link("Jasper Hill Farm's Cheeses", :href=>"/creameries/#{creamery.id}/cheeses")
        click_link "Jasper Hill Farm's Cheeses"
        expect(current_path).to eq("/creameries/#{creamery.id}/cheeses")
    end
end