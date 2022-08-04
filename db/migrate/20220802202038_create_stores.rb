class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name, null: false, unique: true
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false

      t.timestamps
    end
  end
end
