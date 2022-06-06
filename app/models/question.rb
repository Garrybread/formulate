class Question < ApplicationRecord
  
  validates :prompt, presence: true

  belongs_to :form
  has_many :question_responses
end
