class AddReponseToQuestionResponse < ActiveRecord::Migration[6.1]
  def change
    add_reference :question_responses, :response, index: true
  end
end
