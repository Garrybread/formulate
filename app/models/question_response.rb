class QuestionResponse < ApplicationRecord
  
  validates :answer, presence: true

  belongs_to :user
  belongs_to :form
  belongs_to :question
end
