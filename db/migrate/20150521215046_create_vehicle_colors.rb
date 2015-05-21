class CreateVehicleColors < ActiveRecord::Migration
  def change
    create_table :vehicle_colors do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
