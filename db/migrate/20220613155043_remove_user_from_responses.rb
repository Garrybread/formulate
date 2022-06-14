class RemoveUserFromResponses < ActiveRecord::Migration[6.1]
  def change
    remove_column :responses, :user_id
    remove_column :question_responses, :user_id
  end
end
