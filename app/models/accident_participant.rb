class AccidentParticipant < ActiveRecord::Base
  belongs_to :accident
  belongs_to :person
  belongs_to :vehicle

  validates :accident, presence: true

  validates :person,
    presence: true,
    uniqueness: { scope: :accident }

  validates :vehicle,
    presence: true,
    uniqueness: { scope: :accident }
end
