class AddAddressComponentsToBusinesses < ActiveRecord::Migration[6.0]
  def change
    add_column :businesses, :house_number, :string
    add_column :businesses, :road, :string
    add_column :businesses, :suburb, :string
    add_column :businesses, :county, :string
    add_column :businesses, :state, :string
    add_column :businesses, :postcode, :int
    add_column :businesses, :country, :string
    add_column :businesses, :country_code, :string
  end
end
