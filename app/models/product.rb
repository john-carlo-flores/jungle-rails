class Product < ApplicationRecord
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category, validate: true
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true

  def sold_out?
    self.quantity < 1
  end
end
