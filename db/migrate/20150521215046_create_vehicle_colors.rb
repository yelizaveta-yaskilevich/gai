class CreateVehicleColors < ActiveRecord::Migration
  def change
    create_table :vehicle_colors do |t|
      t.string :name
    end

    add_index :vehicle_colors, :name, unique: true
  end
end
