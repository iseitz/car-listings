require 'rails_helper'

feature 'user sees car', %{
  As a car salesperson
  I want to see a list of cars
  So that I can see what cars are available
} do

  # [] Visiting the cars_path should show a list of cars
  # [] I can visit this link from any page of the application

  let!(:car_1) { FactoryBot.create(:car) }
  let!(:car_2) { FactoryBot.create(:car) }

  scenario 'user visits index page directly' do
    visit cars_path

    expect(page).to have_content(car_1.name)
    expect(page).to have_content(car_1.manufacturer.name)
    expect(page).to have_content(car_1.color)
    expect(page).to have_content(car_1.year)
    expect(page).to have_content(car_1.mileage)

    expect(page).to have_content(car_2.name)
  end

  scenario 'user clicks link to get to index page' do
    visit new_car_path

    click_link 'All Cars'

    expect(page).to have_content(car_1.name)
    expect(page).to have_content(car_1.manufacturer.name)
    expect(page).to have_content(car_1.color)
    expect(page).to have_content(car_1.year)
    expect(page).to have_content(car_1.mileage)

    expect(page).to have_content(car_2.name)
  end
end
