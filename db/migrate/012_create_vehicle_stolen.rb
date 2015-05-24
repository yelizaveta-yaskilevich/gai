class CreateVehicleStolen < ActiveRecord::Migration
  def change
    add_column :vehicles, :stolen, :boolean, default: false, null: false
  end
end
