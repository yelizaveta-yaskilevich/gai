class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :vin, null: false, limit: 17
      t.string :reg_number, null: false, limit: 9
      t.date :reg_issued_on, null: false
      t.references :vehicle_model, index: true, foreign_key: true, null: false
      t.references :vehicle_color, index: true, foreign_key: true, null: false
      t.references :person, index: true, foreign_key: true, null: false
      t.integer :year_of_manufacture, null: false
    end
  end
end
