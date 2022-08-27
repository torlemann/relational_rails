require 'rails_helper'

RSpec.describe "creamery's cheeses index" do
  it "displays all cheeses that belong to a creamery" do
    creamery = Creamery.create!(name: "Jasper Hill Farm", date_founded: 2000, owner: "Mateo and Andy Kehler", head_cheesemaker: "Scott Harbour", location: "Vermont", farmstead: true, acreage: 100, awards_won: "All of them")
    cheese = creamery.cheeses.create!(name: "Winnimere", style: "washed", net_wt: 1.0, milk_type: "cow", veg_rennet: false, raw: true)
    cheese2 = creamery.cheeses.create!(name: "Bayley Hazen Blue", style: "blue-veined", net_wt: 7.0, milk_type: "cow", veg_rennet: false, raw: true)

    visit "/creameries/#{creamery.id}/cheeses"

    expect(page).to have_content(cheese.name)
    expect(page).to have_content(cheese2.name)
  end
end