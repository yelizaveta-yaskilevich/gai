class Accident < ActiveRecord::Base
  has_many :accident_participants

  validates :protocol_number, presence: true
  validates :occured_at, presence: true

  def name
    'ДТП - %s' % [protocol_number]
  end
end
