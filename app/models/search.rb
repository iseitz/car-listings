# frozen_string_literal: true

class Search < ApplicationRecord
  def search_cars
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
