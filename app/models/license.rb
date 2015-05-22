class License < ActiveRecord::Base
  belongs_to :person

  validates :number,
    presence: true

  validates :person,
    presence: true

  validates :issued_on,
    presence: true

  validates :ended_on,
    presence: true
end
