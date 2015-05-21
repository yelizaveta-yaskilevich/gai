class Vehicle < ActiveRecord::Base
  belongs_to :vehicle_model
  belongs_to :vehicle_color
  belongs_to :person
end
