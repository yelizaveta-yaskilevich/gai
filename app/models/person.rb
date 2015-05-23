class Person < ActiveRecord::Base
  has_many :vehicles
  has_many :licenses
  has_many :accident_participant

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :middle_name, presence: true

  validates :passport_number,
    presence: true,
    uniqueness: true

  validates :passport_issued_by, presence: true
  validates :passport_issued_on, presence: true
  validates :address_region, presence: true
  validates :address_city, presence: true
  validates :address_street, presence: true
  validates :address_house, presence: true

  def name
    "%s %s. %s." % [last_name, first_name && first_name.first, middle_name && middle_name.first]
  end

  def short_address
    address_street.dup.tap do |r|
      r << " " + address_house if address_house.present?
      r << ", кв. " + address_flat if address_flat.present?
    end
  end
end
