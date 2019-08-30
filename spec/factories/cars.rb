# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    manufacturer
    name { 'BMW' }
    color { 'red' }
    year { '2011' }
    mileage { '120000' }
    description { 'This is a great car, old but well built' }
  end
end
