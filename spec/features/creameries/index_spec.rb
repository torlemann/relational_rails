require 'rails_helper'

RSpec.describe Creamery, type: :feature do
    it 'displays the names of all creameries' do
        creamery = Creamery.create!(name: "Jasper Hill Farm", date_founded: 2000, owner: "Mateo and Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
        creamery2 = Creamery.create!(name: "Test 2 Name", date_founded: 2010, owner: "Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
        creamery3 = Creamery.create!(name: "Test 3 Name", date_founded: 2015, owner: "Mateo", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")

        visit "/creameries"

        expect(page).to have_content(creamery.name)
        expect(page).to have_content(creamery2.name)
        expect(page).to have_content(creamery3.name)
    end

    it "takes you back to cheese index" do
        creamery = Creamery.create!(name: "Jasper Hill Farm", date_founded: 2000, owner: "Mateo and Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
        cheese = creamery.cheeses.create!(name: "Winnimere", style: "washed", net_wt: 1.0, milk_type: "cow", veg_rennet: false, raw: true)
        visit '/creameries'
        expect(page).to have_link("Cheeses")
        click_link 'Cheeses'
        expect(current_path).to eq('/cheeses')
    end


    it 'can create new creamery from and post to index page' do
        visit '/creameries'
        expect(page).to have_link("New Creamery")
        click_link 'New Creamery'
        expect(current_path).to eq('/creameries/new')
        fill_in('name', with: "Barinaga Ranch")
        fill_in('date_founded', with: 2006)
        fill_in('owner', with: "Marcia")
        fill_in('head_cheesemaker', with: "Taryn")
        fill_in('location', with: "Vermont")
        fill_in('farmstead', with: true)
        fill_in('acreage', with: 100)
        fill_in('awards_won', with: "Best in Class")
        click_button 'Create Creamery'
        expect(current_path).to eq('/creameries')
        expect(page).to have_content("Barinaga Ranch")
    end

    # it 'displays the name of the cheese creamery' do
    #     creamery = Creamery.create!(name: "Jasper Hill Farm", date_founded: 2000, owner: "Mateo and Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
    #     cheese = creamery.cheeses.create!(name: "Winnimere", style: "washed", net_wt: 1.0, milk_type: "cow", veg_rennet: false, raw: true)
    #     cheese2 = creamery.cheeses.create!(name: "Bayley Hazen Blue", style: "blue-veined", net_wt: 7.0, milk_type: "cow", veg_rennet: false, raw: true)
        
    #     visit "/cheeses/#{cheese.id}"
    #     save_and_open_page
    #     expect(page).to have_content(creamery.name)
    # end

end