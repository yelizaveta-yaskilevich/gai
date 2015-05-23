class AccidentParticipant < ActiveRecord::Base
  belongs_to :accident
  belongs_to :person
  belongs_to :vehicle

  validates :accident, presence: true
  validates :person, presence: true
  validates :vehicle, presence: true
end
