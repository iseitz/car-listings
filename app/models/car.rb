# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :manufacturer
  validates :manufacturer, presence: true
  validates :name, presence: true
  validates :color, presence: true
  validates :year, presence: true, numericality: { greater_than_or_equal_to: 1920, message: 'Year must be greater than or equal to 1920' }
  validates :mileage, presence: true, numericality: { greater_than_or_equal_to: 0, message: 'must be greater than 0' }

  def condition(year, mileage)
    if year >= 2016 && mileage <= 900
      'Excellent'
    elsif year == 2015 && mileage <= 900 || year >= 2016 && mileage > 900
      'Good'
    elsif year >= 2011 && year <= 2014 && mileage <= 900 || year == 2015 && mileage > 900
      'Fair'
    elsif year >= 2011 && year <= 2014 && mileage > 900 || year < 2011
      'Poor'
    end
  end

  def self.search(manufacturer, color, year, mileage)
    cars = Car.all
    if manufacturer.present?
      @manufacturer = Manufacturer.find_by name: manufacturer
      @manufacturer_id = @manufacturer.id
      cars = cars.where(['manufacturer_id = ?', @manufacturer_id])
    end
    cars = cars.where(['color LIKE ?', color]) if color.present?
    cars = cars.where(['year = ?', year]) if year.present?
    if !mileage == 'N/A'
      cars = cars.where(['mileage <= ?', mileage]) if mileage.present?
    end
    cars
  end
end
