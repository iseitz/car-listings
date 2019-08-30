# frozen_string_literal: true

require 'rails_helper'

feature 'user sees car condition based of year and mileage', %(
  As a used car salesperson
  I would like to see the condition of a car
  So that I know how desirable it is to the buyer.
) do
  # [] I must specify the manufacturer, color, year, and mileage of the car (an association between the car and an existing manufacturer should be created).
  # [] Only years from 1920 and above can be specified.
  # [] I can optionally specify a description of the car.
  # [] If I enter all of the required information in the required formats, the car is recorded and I
  # see the car on the car index page with its condition specified
  # [] If the car was created before year 2012 and its mileage is more than 1000 we recieve Poor condition
  # [] If the car was created between 2012 and 2014 and its mileage is less than 1_000 we recieve Fair condition
  # [] If the car was created between 2014 and 2016 and its mileage is less than 1000 we recieve Good condition
  # [] If the car was created after 2014 and its mileage is less than 900 we recieve Excellent condition

  let!(:manufacturer_1) { FactoryBot.create(:manufacturer) }
  let!(:manufacturer_2) { FactoryBot.create(:manufacturer) }

  scenario 'user successfully adds car with year before 2012 and mileage more than 1000 and poor condition appears' do
    visit new_car_path

    find('#car_manufacturer_id').click
    select manufacturer_2.name
    fill_in 'Name', with: 'Camry'
    fill_in 'Color', with: 'Black'
    fill_in 'Year', with: '2010'
    fill_in 'Mileage', with: '50000'
    fill_in 'Description', with: 'My very first car'
    click_button 'Create Car'

    expect(page).to have_content('Car successfully added')
    expect(page).to have_content('My very first car')
    expect(page).to have_content('Poor')
  end

  scenario 'user successfully adds car with year between 2012-2014 and mileage less than 1000 and fair condition appears' do
    visit new_car_path

    find('#car_manufacturer_id').click
    select manufacturer_2.name
    fill_in 'Name', with: 'Camry1'
    fill_in 'Color', with: 'Red'
    fill_in 'Year', with: '2013'
    fill_in 'Mileage', with: '900'
    fill_in 'Description', with: 'My fathers very first car'
    click_button 'Create Car'

    expect(page).to have_content('Car successfully added')
    expect(page).to have_content('My fathers very first car')
    expect(page).to have_content('Fair')
  end

  scenario 'user successfully adds car with year after 2014 and mileage between 900-1000 and good condition appears' do
    visit new_car_path

    find('#car_manufacturer_id').click
    select manufacturer_2.name
    fill_in 'Name', with: 'Camry2'
    fill_in 'Color', with: 'Yellow'
    fill_in 'Year', with: '2015'
    fill_in 'Mileage', with: '950'
    fill_in 'Description', with: 'My mothers very first car'
    click_button 'Create Car'

    expect(page).to have_content('Car successfully added')
    expect(page).to have_content('My mothers very first car')
    expect(page).to have_content('Good')
  end
  scenario 'user successfully adds car with year after 2015 and mileage less than 900 and Excellent condition appears' do
    visit new_car_path

    find('#car_manufacturer_id').click
    select manufacturer_2.name
    fill_in 'Name', with: 'Camry3'
    fill_in 'Color', with: 'Green'
    fill_in 'Year', with: '2016'
    fill_in 'Mileage', with: '800'
    fill_in 'Description', with: 'My mothers very first car'
    click_button 'Create Car'

    expect(page).to have_content('Car successfully added')
    expect(page).to have_content('My mothers very first car')
    expect(page).to have_content('Excellent')
  end
end
