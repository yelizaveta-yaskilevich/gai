class License < ActiveRecord::Base
  belongs_to :person
  has_and_belongs_to_many :vehicle_categories, join_table: 'license_vehicle_categories'

  validates :number,
    presence: true,
    uniqueness: true

  validates :person,
    presence: true

  validates :issued_on,
    presence: true

  validates :ended_on,
    presence: true

  def name
    number
  end
end
