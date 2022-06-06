class Form < ApplicationRecord
    
    validates :name, presence: true, uniqueness: true
    validates :description, presence: true

    has_many :questions
    has_many :question_responses
    has_many :users_forms
    has_many :users, through: :users_forms
end
