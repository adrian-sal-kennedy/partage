class AddUserIdToAgreements < ActiveRecord::Migration[6.0]
  def change
    add_reference :agreements, :user, null: false, foreign_key: true
  end
end
