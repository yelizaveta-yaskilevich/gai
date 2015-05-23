class CreateForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :accident_participants, :accidents, on_delete: :cascade, on_update: :cascade
    add_foreign_key :accident_participants, :people, on_delete: :cascade, on_update: :cascade
    add_foreign_key :accident_participants, :vehicles, on_delete: :cascade, on_update: :cascade
    add_foreign_key :license_vehicle_categories, :licenses, on_delete: :cascade, on_update: :cascade
    add_foreign_key :license_vehicle_categories, :vehicle_categories, on_delete: :cascade, on_update: :cascade
    add_foreign_key :licenses, :people, on_delete: :cascade, on_update: :cascade
    add_foreign_key :vehicle_models, :vehicle_categories, on_delete: :cascade, on_update: :cascade
    add_foreign_key :vehicles, :people, on_delete: :cascade, on_update: :cascade
    add_foreign_key :vehicles, :vehicle_colors, on_delete: :cascade, on_update: :cascade
    add_foreign_key :vehicles, :vehicle_models, on_delete: :cascade, on_update: :cascade
  end
end
