class CreateVehicleModels < ActiveRecord::Migration
  def change
    create_table :vehicle_models do |t|
      t.references :vehicle_category, index: true, foreign_key: true, null: false
      t.string :name
    end

    add_index :vehicle_models, :name, unique: true
  end
end
