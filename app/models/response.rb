class Response < ApplicationRecord
  include AASM
  
  default_scope { order(:created_at) }

  belongs_to :form
  has_many :question_responses

  accepts_nested_attributes_for :question_responses, reject_if: :all_blank, allow_destroy: true

  aasm do
    state :pending, initial: true
    state :approved, :declined

    event :approve do
      transitions to: :approved
    end

    event :decline do
      transitions to: :declined
    end

    event :repend do
      transitions to: :pending
    end
  end
end
