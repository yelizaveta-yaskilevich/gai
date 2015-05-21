class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :address_region
      t.string :address_area
      t.string :address_city
      t.string :address_street
      t.string :address_house
      t.string :address_flat

      t.timestamps null: false
    end
  end
end
