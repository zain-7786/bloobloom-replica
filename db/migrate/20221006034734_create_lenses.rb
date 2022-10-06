# frozen_string_literal: true

class CreateLenses < ActiveRecord::Migration[6.0]
  def change
    create_table :lenses do |t|
      t.string :color, null: false
      t.text :description, null: false
      t.integer :prescription_type, null: false, default: 0
      t.integer :lens_type, null: false, default: 0
      t.integer :stock, null: false, default: 0
      t.float :price, null: false, default: 0
      t.timestamps
    end
  end
end
