class Question < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  validates :prompt, presence: true

  belongs_to_active_hash :question_type
  belongs_to :form
  has_many :question_responses, dependent: :destroy

end
