class AccidentParticipant < ActiveRecord::Base
  belongs_to :accident
  belongs_to :person
  belongs_to :vehicle
end
