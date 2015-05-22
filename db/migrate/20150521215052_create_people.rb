class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :passport, null: false, limit: 12
      t.string :first_name, null: false
      t.string :middle_name, null: false
      t.string :last_name, null: false
      t.string :address_region, null: false
      t.string :address_area, null: false
      t.string :address_city, null: false
      t.string :address_street, null: false
      t.string :address_house
      t.string :address_flat
      t.timestamps null: false
    end
  end
end
