class CreateVehicleCategories < ActiveRecord::Migration
  def change
    create_table :vehicle_categories do |t|
      t.string :name
      t.text :description
    end
  end
end
