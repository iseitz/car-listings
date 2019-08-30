# frozen_string_literal: true

class CreateManufacturers < ActiveRecord::Migration[5.0]
  def change
    create_table :manufacturers do |t|
      t.string :name, null: false, unique: true
      t.string :country, null: false

      t.timestamps
    end
  end
end
