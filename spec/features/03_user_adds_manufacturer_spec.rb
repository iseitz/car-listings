require 'rails_helper'

feature 'user adds manufacturer', %{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
} do

  # [] I must specify a manufacturer name and country.
  # [] If I do not specify the required information, I am presented with errors.
  # [] If I specify the required information, the manufacturer is recorded and I am redirected to the index of manufacturers

  scenario 'user successfully adds manufacturer with valid input' do
    visit new_manufacturer_path

    fill_in 'Name', with: 'Toyota'
    fill_in 'Country', with: 'Japan'
    click_button 'Create Manufacturer'

    expect(page).to have_content('Manufacturer successfully added')
    expect(page).to have_content('Toyota')
  end

  scenario 'user enters invalid inputs for manufacturer and sees errors' do
    visit new_manufacturer_path

    fill_in 'Name', with: ''
    fill_in 'Country', with: ''
    click_button 'Create Manufacturer'

    expect(page).to_not have_content('Manufacturer successfully added')
    expect(page).to have_content('Name can\'t be blank')
    expect(page).to have_content('Country can\'t be blank')
  end
end
