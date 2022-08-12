class CreateVariantOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :variant_options do |t|
      t.string :name
      t.references :variant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
