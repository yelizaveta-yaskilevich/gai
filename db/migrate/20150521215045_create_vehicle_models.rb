class CreateVehicleModels < ActiveRecord::Migration
  def change
    create_table :vehicle_models do |t|
      t.references :vehicle_category, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
