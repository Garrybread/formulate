class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.float :price, null: false
      t.references :store, null: false, foreign_key: true

      t.timestamps

    end
    add_column :stores, :product_id, :bigint, index: true
  end
end
