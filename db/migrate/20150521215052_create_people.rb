class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name, null: false
      t.string :middle_name, null: false
      t.string :last_name, null: false
      t.string :passport_number, null: false, limit: 12
      t.string :passport_issued_by, null: false
      t.date :passport_issued_on, null: false
      t.string :address_region, null: false
      t.string :address_area, null: false
      t.string :address_city, null: false
      t.string :address_street, null: false
      t.string :address_house
      t.string :address_flat
    end

    add_index :people, :passport_number, unique: true
  end
end
