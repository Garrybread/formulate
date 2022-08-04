class Store < ApplicationRecord

    validates :name, presence: true, uniqueness: true
    validates :street, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :country, presence: true
    validates :photo, presence: true
    validate :validate_address

    has_one_attached :photo

    before_save :set_pos

    def address
        [street, city, state, country].compact.join(', ')
    end

    geocoded_by :address
    after_validation :geocode

    private

    def set_pos
        self.latitude = self.geocode.first
        self.longitude = self.geocode.last
    end

    def validate_address
        if self.geocode.nil?
            errors.add(:base, "Please enter a real address.")
        end
    end
    
end
