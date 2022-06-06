class CreateUsersForms < ActiveRecord::Migration[6.1]
  def change
    create_table :users_forms do |t|
      t.references :user, null: false, foreign_key: true
      t.references :form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
