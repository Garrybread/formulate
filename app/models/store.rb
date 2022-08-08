class Store < ApplicationRecord

    validates :name, presence: true
    validates :street, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :country, presence: true
    validates :photo, presence: true
    # validate :validate_address

    has_one_attached :photo
    has_many :products, index_errors: true, dependent: :destroy

    accepts_nested_attributes_for :products, reject_if: :all_blank, allow_destroy: true
    validates_associated :products

    # before_save :set_pos

    def address
        [street, city, state, country].compact.join(', ')
    end

    geocoded_by :address
    after_validation :geocode

    private

    # def set_pos
    #     self.latitude = self.geocode.first
    #     self.longitude = self.geocode.last
    # end

    # def validate_address
    #     if self.geocode.nil?
    #         errors.add(:base, "Please enter a real address.")
    #     end
    # end
    
end
