class Resource < ApplicationRecord
  belongs_to :user
  belongs_to :business
  has_many :agreements, dependent: :destroy

  def user_id
    id = User.includes(businesses: [:resources]).find(Business.find(self.business_id).id).id
    return id
  end

end
