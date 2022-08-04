class Question < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  validates :prompt, presence: true
  validates :question_type_id, presence: true
  validates :options, presence: true, unless: :question_type_is_text
  
  
  belongs_to_active_hash :question_type
  belongs_to :form
  has_many :question_responses, dependent: :destroy
  has_many :options, dependent: :destroy, index_errors: true
  
  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true
  
  private

  def question_type_is_text
    question_type_id == 1
  end

end
