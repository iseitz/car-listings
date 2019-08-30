require 'rails_helper'

feature 'user sees manufacturer', %{
  As a car salesperson
  I want to see a list of manufacturers
  So that I can see what types of cars are available
} do

  # [] Visiting the manufacturers_path should show a list of manufacturers
  # [] I can visit this link from any page of the application

  let!(:manufacturer_1) { FactoryBot.create(:manufacturer) }
  let!(:manufacturer_2) { FactoryBot.create(:manufacturer) }

  scenario 'user visits index page directly' do
    visit manufacturers_path

    expect(page).to have_content(manufacturer_1.name)
    expect(page).to have_content(manufacturer_1.country)

    expect(page).to have_content(manufacturer_2.name)
  end

  scenario 'user clicks link to get to index page' do
    visit new_manufacturer_path

    click_link 'All Manufacturers'

    expect(page).to have_content(manufacturer_1.name)
    expect(page).to have_content(manufacturer_1.country)

    expect(page).to have_content(manufacturer_2.name)
  end
end
