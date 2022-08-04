class AddLatAndLongToStoresAndChangeAddressToStreetAndAddCountry < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :latitude, :float, index: true
    add_column :stores, :longitude, :float, index: true

    remove_column :stores, :address, :string
    add_column :stores, :street, :string, index: true

    add_column :stores, :country, :string, index: true
  end
end
