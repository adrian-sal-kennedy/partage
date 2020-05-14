class CreateAgreements < ActiveRecord::Migration[6.0]
  def change
    create_table :agreements do |t|
      t.references :resource, null: false, foreign_key: true
      t.references :business, null: false, foreign_key: true
      t.text :terms
      t.integer :price

      t.timestamps
    end
  end
end
