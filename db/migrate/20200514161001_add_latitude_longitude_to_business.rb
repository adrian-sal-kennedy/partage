class AddLatitudeLongitudeToBusiness < ActiveRecord::Migration[6.0]
  def change
    add_column :businesses, :latitude, :float
    add_column :businesses, :longitude, :float
  end
end
