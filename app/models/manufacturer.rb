# frozen_string_literal: true

class Manufacturer < ApplicationRecord
  has_many :cars
  validates_associated :cars
  validates :name, presence: true, uniqueness: true
  validates :country, presence: true
end
