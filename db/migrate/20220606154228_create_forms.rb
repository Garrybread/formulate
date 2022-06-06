class CreateForms < ActiveRecord::Migration[6.1]
  def change
    create_table :forms do |t|
      t.string :name, null: false, unique: true
      t.text :description, null: false

      t.timestamps
    end
  end
end
