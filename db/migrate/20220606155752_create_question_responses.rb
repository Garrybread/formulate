class CreateQuestionResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :question_responses do |t|
      t.text :answer, null: false
      t.references :user, null: false, foreign_key: true
      t.references :form, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
