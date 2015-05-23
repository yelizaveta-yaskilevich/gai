class CreateVehicleColors < ActiveRecord::Migration
  def change
    create_table :vehicle_colors do |t|
      t.string :name
    end
  end
end
