class Question < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  validates :prompt, presence: true
  validates :question_type_id, presence: true

  belongs_to_active_hash :question_type
  belongs_to :form
  has_many :question_responses, dependent: :destroy
  has_many :options, dependent: :destroy

  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true

end
