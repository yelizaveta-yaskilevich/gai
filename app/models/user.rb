class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable

  validates :username,
    presence: true

  validates :password,
    presence: true,
    confirmation: true

  validates :password_confirmation,
    presence: true
end
