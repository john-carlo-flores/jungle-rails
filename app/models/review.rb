class Review < ApplicationRecord
  belongs_to :product, validate: true
  belongs_to :user, validate: true

  validates_presence_of :description, :rating

  def star_ratings
    gold_stars = (1..self.rating).map {|rating| "⭐"}
    gold_stars.join
  end
end
