require 'rails_helper'

RSpec.describe "creamery's cheeses index" do
  it "displays all cheeses that belong to a creamery" do
    creamery = Creamery.create!(name: "Jasper Hill Farm", date_founded: 2000, owner: "Mateo and Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
    creamery2 = Creamery.create!(name: "Point Reyes", date_founded: 2000, owner: "Bob", head_cheesemaker: "Koob", location: "CA", farmstead: true, acreage: 100, awards_won: "All of them")
    cheese = creamery.cheeses.create!(name: "Winnimere", style: "washed", net_wt: 1.0, milk_type: "cow", veg_rennet: false, raw: true)
    cheese2 = creamery.cheeses.create!(name: "Bayley Hazen Blue", style: "blue-veined", net_wt: 7.0, milk_type: "cow", veg_rennet: false, raw: true)
    cheese3 = creamery2.cheeses.create!(name: "Original Blue", style: "blue-veined", net_wt: 7.0, milk_type: "cow", veg_rennet: false, raw: true)

    visit "/creameries/#{creamery.id}/cheeses"
    #save_and_open_page
    expect(page).to have_content(cheese.name)
    expect(page).to have_content(cheese.style)
    expect(page).to have_content(cheese.net_wt)
    expect(page).to have_content(cheese.milk_type)
    expect(page).to have_content(cheese.veg_rennet)
    expect(page).to have_content(cheese.raw)
    expect(page).to have_content(cheese2.name)
    expect(page).to have_content(cheese2.style)
    expect(page).to have_content(cheese2.net_wt)
    expect(page).to have_content(cheese2.milk_type)
    expect(page).to have_content(cheese2.veg_rennet)
    expect(page).to have_content(cheese2.raw)
    expect(page).to_not have_content(cheese3.name)
  end

  it "takes you back to creamery index" do
    creamery = Creamery.create!(name: "Jasper Hill Farm", date_founded: 2000, owner: "Mateo and Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
    cheese = creamery.cheeses.create!(name: "Winnimere", style: "washed", net_wt: 1.0, milk_type: "cow", veg_rennet: false, raw: true)
    visit "/cheeses/#{cheese.id}"
    expect(page).to have_link("Creamery Index")
    click_link 'Creamery Index'
    expect(current_path).to eq('/creameries')
  end

  it "can add a cheese to creamery's cheese index" do
    creamery = Creamery.create!(name: "Jasper Hill Farm", date_founded: 2000, owner: "Mateo and Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
    cheese = creamery.cheeses.create!(name: "Winnimere", style: "washed", net_wt: 1.0, milk_type: "cow", veg_rennet: false, raw: true)
    visit "/creameries/#{creamery.id}/cheeses"
    expect(page).to have_link("Add a Cheese Variety")
    click_link 'Add a Cheese Variety'
    expect(current_path).to eq("/creameries/#{creamery.id}/cheeses/new")
    fill_in('name', with: "Winnimere")
    fill_in('style', with: "washed")
    fill_in('net_wt', with: 1.0)
    fill_in('milk_type', with: "cow")
    fill_in('veg_rennet', with: false)
    fill_in('raw', with: true)
    click_button 'Add Cheese'
    expect(current_path).to eq("/creameries/#{creamery.id}/cheeses")
    expect(page).to have_content("Winnimere")
  end

  it 'links to alpha sort cheeses' do
    creamery1 = Creamery.create!(name: "Jasper Hill Farm", date_founded: 2000, owner: "Mateo and Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
    cheese1 = creamery1.cheeses.create!(name: "Winnimere", style: "washed", net_wt: 1.0, milk_type: "cow", veg_rennet: false, raw: true)
    cheese2 = creamery1.cheeses.create!(name: "Bayley Hazen Blue", style: "blue-veined", net_wt: 7.0, milk_type: "cow", veg_rennet: true, raw: true)
    
    visit "/creameries/#{creamery1.id}/cheeses"
    expect(page).to have_link('Sort cheeses alphabetically')
    click_link 'Sort cheeses alphabetically'
    expect(current_path).to eq("/creameries/#{creamery1.id}/cheeses/")
    expect(cheese2.name).to appear_before(cheese1.name)
    save_and_open_page
  end

  it "links to edit each cheese" do
    creamery1 = Creamery.create!(name: "Jasper Hill Farm", date_founded: 2000, owner: "Mateo and Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
    cheese1 = creamery1.cheeses.create!(name: "Winnimere", style: "washed", net_wt: 1.0, milk_type: "cow", veg_rennet: false, raw: true)
    visit '/cheeses'
    click_link "Update"
    expect(current_path).to eq("/cheeses/#{cheese1.id}/edit")
  end

  it "can delete from creamery cheese's index page " do
    Creamery.destroy_all
    creamery = Creamery.create!(name: "Jasper Hill Farm", date_founded: 2000, owner: "Mateo and Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
    cheese = creamery.cheeses.create!(name: "Winnimere", style: "washed", net_wt: 1.0, milk_type: "cow", veg_rennet: false, raw: true)

    visit "/creameries/#{creamery.id}/cheeses"
    click_link "Delete #{cheese.name}"
    expect(current_path).to eq ('/cheeses')
    expect(page).to_not have_content("Winnimere")
  end

end