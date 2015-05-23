class Vehicle < ActiveRecord::Base
  belongs_to :vehicle_model
  belongs_to :vehicle_color
  belongs_to :person

  has_one :vehicle_category, through: :vehicle_model
  has_many :accident_participant
  has_many :accidents, through: :accident_participant

  validates :reg_number,
    presence: true

  validates :reg_issued_on,
    presence: true

  validates :person,
    presence: true

  validates :vehicle_model,
    presence: true

  validates :vehicle_color,
    presence: true

  validates :vin,
    presence: true

  validates :year_of_manufacture,
    presence: true

  def name
    reg_number
  end

  def accidents_count
    accidents.count
  end
end
