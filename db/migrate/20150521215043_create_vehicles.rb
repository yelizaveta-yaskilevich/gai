class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :vin
      t.references :vehicle_model, index: true, foreign_key: true
      t.references :vehicle_color, index: true, foreign_key: true
      t.integer :year
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
