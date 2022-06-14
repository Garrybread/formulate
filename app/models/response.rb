class Response < ApplicationRecord
  belongs_to :form
  has_many :question_responses

  accepts_nested_attributes_for :question_responses, reject_if: :all_blank, allow_destroy: true
end
