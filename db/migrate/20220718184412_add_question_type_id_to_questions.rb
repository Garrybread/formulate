class AddQuestionTypeIdToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :question_type_id, :bigint, index: true
  end
end
