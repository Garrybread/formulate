class Product < ApplicationRecord
  
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  belongs_to :store
  has_many_attached :photos
end