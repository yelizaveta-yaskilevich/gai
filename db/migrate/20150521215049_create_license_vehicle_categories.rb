class CreateLicenseVehicleCategories < ActiveRecord::Migration
  def change
    create_table :license_vehicle_categories do |t|
      t.references :license, index: true, foreign_key: true
      t.references :vehicle_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
