class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.text :name
      t.references :business, null: false, foreign_key: true
      t.text :description
      t.text :picture

      t.timestamps
    end
  end
end
