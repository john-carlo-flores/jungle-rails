class User < ApplicationRecord
  validates_presence_of :password, :password_confirmation

  has_secure_password
end
