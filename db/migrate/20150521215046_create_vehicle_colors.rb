class CreateVehicleColors < ActiveRecord::Migration
  def change
    create_table :vehicle_colors do |t|
      t.string :name, null: false
    end

    add_index :vehicle_colors, :name, unique: true
  end
end
