class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, unique: true, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :contact_number, null: false
      t.timestamps
    end
  end
end
