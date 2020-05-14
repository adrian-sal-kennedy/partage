class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.text :name
      t.text :url
      t.text :location
      t.text :description

      t.timestamps
    end
  end
end
