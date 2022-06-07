class User < ApplicationRecord
  validates :password, :password_confirmation, length: { minimum: 6 }, presence: true
  validates_presence_of :email, :first_name, :last_name
  validates :email, :uniqueness => { case_sensitive: false }

  has_secure_password
end
