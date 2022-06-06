class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :prompt, null: false
      t.references :form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
