class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :name
      t.text :position
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end
