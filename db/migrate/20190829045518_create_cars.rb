# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.belongs_to :manufacturer, null: false
      t.string :name, null: false
      t.string :color, null: false
      t.integer :year, null: false
      t.integer :mileage, null: false
      t.text :description

      t.timestamps
    end
  end
end
