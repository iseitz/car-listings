# frozen_string_literal: true

FactoryBot.define do
  factory :manufacturer do
    sequence(:name) { |n| "Toyota#{n}" }
    country { 'Japan' }
  end
end
