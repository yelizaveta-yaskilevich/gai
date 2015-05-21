class LicenseVehicleCategory < ActiveRecord::Base
  belongs_to :license
  belongs_to :vehicle_category
end
