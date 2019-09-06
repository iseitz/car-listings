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
  # [] If the car was created before year 2014 and its mileage is more than 900 we recieve Poor condition
  # [] If the car was created between 2011 and 2014 and its mileage is less than 900 we recieve Fair condition
  # [] If the car was created in 2015 and its mileage is more than 900 we recieve Fair condition
  # [] If the car was created in or after 2016 and its mileage is more than 900 we recieve Good condition
  # [] If the car was created in 2015 and its mileage is less or equal to 900 we recieve Good condition
  # [] If the car was created in or after 2016 and its mileage is less or equal to 900 we recieve Excellent condition

  let!(:manufacturer_1) { FactoryBot.create(:manufacturer) }
  let!(:manufacturer_2) { FactoryBot.create(:manufacturer) }

  scenario 'user successfully adds car with year before 2014 and mileage more than 900 and poor condition appears' do
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

  scenario 'user successfully adds car built in 2011 and  50_000 mileage and poor condition appears' do
    visit new_car_path

    find('#car_manufacturer_id').click
    select manufacturer_2.name
    fill_in 'Name', with: 'Camry1'
    fill_in 'Color', with: 'Black'
    fill_in 'Year', with: '2011'
    fill_in 'Mileage', with: '50000'
    fill_in 'Description', with: 'One old car'
    click_button 'Create Car'

    expect(page).to have_content('Car successfully added')
    expect(page).to have_content('One old car')
    expect(page).to have_content('Poor')
  end

  scenario 'user successfully adds car with year before 2011 and mileage more than 900 and poor condition appears' do
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

  scenario 'user successfully adds car with year before 2011 and mileage less than 900 and poor condition appears' do
    visit new_car_path

    find('#car_manufacturer_id').click
    select manufacturer_2.name
    fill_in 'Name', with: 'Camry'
    fill_in 'Color', with: 'Black'
    fill_in 'Year', with: '2010'
    fill_in 'Mileage', with: '500'
    fill_in 'Description', with: 'My very first car'
    click_button 'Create Car'

    expect(page).to have_content('Car successfully added')
    expect(page).to have_content('My very first car')
    expect(page).to have_content('Poor')
  end

  scenario 'user successfully adds car built between 2011-2014 and mileage less or equal to 900 and fair condition appears' do
    visit new_car_path

    find('#car_manufacturer_id').click
    select manufacturer_2.name
    fill_in 'Name', with: 'Camry2'
    fill_in 'Color', with: 'Red'
    fill_in 'Year', with: '2013'
    fill_in 'Mileage', with: '900'
    fill_in 'Description', with: 'My fathers very first car'
    click_button 'Create Car'

    expect(page).to have_content('Car successfully added')
    expect(page).to have_content('My fathers very first car')
    expect(page).to have_content('Fair')
  end

  scenario 'user successfully adds car built in 2011 and mileage less or equal to 900 and fair condition appears' do
    visit new_car_path

    find('#car_manufacturer_id').click
    select manufacturer_2.name
    fill_in 'Name', with: 'Camry3'
    fill_in 'Color', with: 'Red'
    fill_in 'Year', with: '2011'
    fill_in 'Mileage', with: '900'
    fill_in 'Description', with: 'My fathers very first car'
    click_button 'Create Car'

    expect(page).to have_content('Car successfully added')
    expect(page).to have_content('My fathers very first car')
    expect(page).to have_content('Fair')
  end

  scenario 'user successfully adds car built in 2014 and mileage less or equal to 900 and fair condition appears' do
    visit new_car_path

    find('#car_manufacturer_id').click
    select manufacturer_2.name
    fill_in 'Name', with: 'Camry4'
    fill_in 'Color', with: 'Red'
    fill_in 'Year', with: '2014'
    fill_in 'Mileage', with: '900'
    fill_in 'Description', with: 'My fathers very first car'
    click_button 'Create Car'

    expect(page).to have_content('Car successfully added')
    expect(page).to have_content('My fathers very first car')
    expect(page).to have_content('Fair')
  end

  scenario 'user successfully adds car created in 2015 and mileage more than 900 and fair condition appears' do
    visit new_car_path

    find('#car_manufacturer_id').click
    select manufacturer_2.name
    fill_in 'Name', with: 'Camry5'
    fill_in 'Color', with: 'Green'
    fill_in 'Year', with: '2015'
    fill_in 'Mileage', with: '1000'
    fill_in 'Description', with: 'My fathers second car'
    click_button 'Create Car'

    expect(page).to have_content('Car successfully added')
    expect(page).to have_content('My fathers second car')
    expect(page).to have_content('Fair')
  end

  scenario 'user successfully adds car with year 2016, mileage is more than 900 and good condition appears' do
    visit new_car_path

    find('#car_manufacturer_id').click
    select manufacturer_2.name
    fill_in 'Name', with: 'Camry6'
    fill_in 'Color', with: 'Yellow'
    fill_in 'Year', with: '2016'
    fill_in 'Mileage', with: '1000'
    fill_in 'Description', with: 'My mothers very first car'
    click_button 'Create Car'

    expect(page).to have_content('Car successfully added')
    expect(page).to have_content('My mothers very first car')
    expect(page).to have_content('Good')
  end

  scenario 'user successfully adds car with year after 2016, mileage is more than 900 and good condition appears' do
    visit new_car_path

    find('#car_manufacturer_id').click
    select manufacturer_2.name
    fill_in 'Name', with: 'Camry7'
    fill_in 'Color', with: 'Yellow'
    fill_in 'Year', with: '2018'
    fill_in 'Mileage', with: '5000'
    fill_in 'Description', with: 'Good car'
    click_button 'Create Car'

    expect(page).to have_content('Car successfully added')
    expect(page).to have_content('Good car')
    expect(page).to have_content('Good')
  end

  scenario 'user successfully adds car built in 2015, mileage is less or equal to 900 and good condition appears' do
    visit new_car_path

    find('#car_manufacturer_id').click
    select manufacturer_2.name
    fill_in 'Name', with: 'Camry8'
    fill_in 'Color', with: 'Orange'
    fill_in 'Year', with: '2015'
    fill_in 'Mileage', with: '900'
    fill_in 'Description', with: 'Very Good car'
    click_button 'Create Car'

    expect(page).to have_content('Car successfully added')
    expect(page).to have_content('Very Good car')
    expect(page).to have_content('Good')
  end

  scenario 'user successfully adds car with year equal to 2016 and mileage equal to 900 and Excellent condition appears' do
    visit new_car_path

    find('#car_manufacturer_id').click
    select manufacturer_2.name
    fill_in 'Name', with: 'Camry9'
    fill_in 'Color', with: 'Purple'
    fill_in 'Year', with: '2016'
    fill_in 'Mileage', with: '900'
    fill_in 'Description', with: 'My very first car'
    click_button 'Create Car'

    expect(page).to have_content('Car successfully added')
    expect(page).to have_content('My very first car')
    expect(page).to have_content('Excellent')
  end

  scenario 'user successfully adds car with year after 2016 and mileage less than 900 and Excellent condition appears' do
    visit new_car_path

    find('#car_manufacturer_id').click
    select manufacturer_2.name
    fill_in 'Name', with: 'Camry9'
    fill_in 'Color', with: 'Purple'
    fill_in 'Year', with: '2019'
    fill_in 'Mileage', with: '800'
    fill_in 'Description', with: 'My very first car'
    click_button 'Create Car'

    expect(page).to have_content('Car successfully added')
    expect(page).to have_content('My very first car')
    expect(page).to have_content('Excellent')
  end
end
