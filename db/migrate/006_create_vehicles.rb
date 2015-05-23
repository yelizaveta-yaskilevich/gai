class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :vin, null: false, limit: 17
      t.string :reg_number, null: false, limit: 9
      t.date :reg_issued_on, null: false
      t.references :vehicle_model, null: false, index: true
      t.references :vehicle_color, null: false, index: true
      t.references :person, null: false, index: true
      t.integer :year_of_manufacture, null: false
    end

    add_index :vehicles, :vin, unique: true
    add_index :vehicles, :reg_number, unique: true
  end
end
