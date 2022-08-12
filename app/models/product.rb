class Product < ApplicationRecord
  
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  belongs_to :store
  has_one_attached :photo
  has_many :variants, dependent: :destroy

  accepts_nested_attributes_for :variants, reject_if: :all_blank, allow_destroy: true
  validates_associated :variants
end
