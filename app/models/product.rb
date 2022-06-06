class Product < ApplicationRecord
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category, validate: true

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
