class LicenseVehicleCategory < ActiveRecord::Base
  belongs_to :license
  belongs_to :vehicle_category

  validates :license, presence: true
  validates :vehicle_category,
    presence: true,
    uniqueness: { scope: :license }
end
