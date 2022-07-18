class Option < ApplicationRecord

    validates :text, presence: true
    validates :question_id, presence: true

    belongs_to :question

end
