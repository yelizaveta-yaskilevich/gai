class VehicleModel < ActiveRecord::Base
  belongs_to :vehicle_category

  validates :name,
    presence: true,
    uniqueness: true

  validates :vehicle_category,
    presence: true
end
