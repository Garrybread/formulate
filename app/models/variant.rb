class Variant < ApplicationRecord
  validates :name, presence: true
  belongs_to :product
  has_many :variant_options, dependent: :destroy
  accepts_nested_attributes_for :variant_options, reject_if: :all_blank, allow_destroy: true
  validates_associated :variant_options
end
