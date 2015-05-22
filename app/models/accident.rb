class Accident < ActiveRecord::Base
  validates :protocol_number,
    presence: true

  validates :occured_at,
    presence: true

  def name
    protocol_number
  end
end
