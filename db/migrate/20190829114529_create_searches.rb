# frozen_string_literal: true

class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :manufacturer
      t.string :color
      t.integer :year
      t.integer :mileage

      t.timestamps
    end
  end
end
