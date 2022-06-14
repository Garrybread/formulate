class QuestionResponse < ApplicationRecord
  
  validates :answer, presence: true

  belongs_to :response
  belongs_to :question
end
