class CreateLicenseVehicleCategories < ActiveRecord::Migration
  def change
    create_table :license_vehicle_categories do |t|
      t.references :license, null: false, index: true
      t.references :vehicle_category, null: false, index: true
    end

    add_index :license_vehicle_categories, [:license_id, :vehicle_category_id], unique: true, name: 'index_license_vehicle_categories_uniq'
  end
end
