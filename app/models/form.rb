class Form < ApplicationRecord
    
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true

    has_many :questions, index_errors: true, dependent: :destroy
    has_many :responses, dependent: :destroy
    has_many :users_forms, dependent: :destroy
    has_many :users, through: :users_forms

    accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
    validates_associated :questions

end
