class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.string :text, null: false
      t.references :question, null: false, foreign_key: true

      t.timestamps

    add_column :questions, :option_id, :bigint, index: true
    end
  end
end
