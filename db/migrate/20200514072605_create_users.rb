class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :name
      t.text :position

      t.timestamps
    end
  end
end
# class CreateBusinesses < ActiveRecord::Migration[6.0]
#   def change
#     create_table :businesses do |t|
#       t.text :name
#       t.text :url
#       t.text :location
#       t.text :description
#       t.references :user, null: false, foreign_key: true

#       t.timestamps
#     end
#   end
# end
