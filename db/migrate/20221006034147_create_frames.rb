class CreateFrames < ActiveRecord::Migration[6.0]
  def change
    create_table :frames do |t|
      t.string :name, unique: true, null: false
      t.text :description, null: false
      t.integer :status, null: false, default: 0
      t.float :price, null: false, default: 0
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
