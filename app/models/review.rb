class Review < ApplicationRecord
  belongs_to :product, validate: true
  belongs_to :user, validate: true

  validates_presence_of :description, :rating
end
