# frozen_string_literal: true

require 'rails_helper'

feature 'user searches for car via search', %(
  As a car buyer
  I want to search for specific cars
  So that I can look at the cars that I am interested in
) do
  # [] I must specify the manufacturer, color, year, and maximum mileage of the car in search.
  # [] I receive the details of all cars matching the serach criteria
  # [] If I specify the mileage - the serach checks for all cars with the mileage equal or lower than the specified number
  # [] If I chose N/A in the mileage, the mileage is not taken into account.
  # [] If I leave the search areas untouched and click Search button I will get to the result page with full list of all cars.

  let!(:manufacturer_1) { Manufacturer.create(name: 'Ford', country: 'USA') }
  let!(:manufacturer_2) { Manufacturer.create(name: 'Lada', country: 'Russia') }
  let!(:car_1) { FactoryBot.create(:car, manufacturer: manufacturer_1) }
  let!(:car_2) { FactoryBot.create(:car, name: 'devyatka', manufacturer: manufacturer_2, color: 'green', mileage: '1000') }
  let!(:car_3) { FactoryBot.create(:car, manufacturer: manufacturer_1, color: 'sparkle') }

  scenario 'user specifies the criterias matching a car in the base and the result appears' do
    visit cars_path

    find('#manufacturer').click
    select manufacturer_2.name
    find('#color').click
    select car_2.color
    find('#year').click
    select car_2.year
    find('#mileage').click
    select '1000'

    click_button 'Search'

    expect(page).to have_content(car_2.name.to_s)
    expect(page).to have_content(car_2.color.to_s)
    expect(page).to have_content(car_2.name.to_s)
    expect(page).to have_content('Poor')
    expect(page).to_not have_content(car_1.name.to_s)
    expect(page).to_not have_content(car_3.name.to_s)
  end

  scenario 'user picks N/A for mileage and specifies the criterias matching a car in the base and the result appears' do
    visit cars_path

    find('#manufacturer').click
    select manufacturer_2.name
    find('#color').click
    select car_2.color
    find('#year').click
    select car_2.year
    find('#mileage').click
    select 'N/A'

    click_button 'Search'

    expect(page).to have_content(car_2.name.to_s)
    expect(page).to have_content(car_2.color.to_s)
    expect(page).to have_content(car_2.name.to_s)
    expect(page).to have_content('Poor')
    expect(page).to_not have_content(car_1.name.to_s)
    expect(page).to_not have_content(car_3.name.to_s)
  end
  scenario 'user clicks Search button without specifying anything and sees a full list of all cars on the results page' do
    visit cars_path

    click_button 'Search'

    expect(page).to have_content(car_2.name.to_s)
    expect(page).to have_content(car_2.color.to_s)
    expect(page).to have_content(car_2.year.to_s)
    expect(page).to have_content('Poor')
    expect(page).to have_content(car_1.name.to_s)
    expect(page).to have_content(car_1.color.to_s)
    expect(page).to have_content(car_1.year.to_s)
    expect(page).to have_content(car_3.name.to_s)
    expect(page).to have_content(car_3.color.to_s)
    expect(page).to have_content(car_3.year.to_s)
  end
end
