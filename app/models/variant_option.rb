class VariantOption < ApplicationRecord
  validates :name, presence: true
  belongs_to :variant
end
