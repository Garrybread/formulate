class RemoveFormFromQuestionResponse < ActiveRecord::Migration[6.1]
  def change
    remove_column :question_responses, :form_id
  end
end
