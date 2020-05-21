class Resource < ApplicationRecord
  belongs_to :user
  belongs_to :business
  has_many :agreements, dependent: :destroy
  has_one_attached :picture
  
  # def user_id
  #   if self.id
  #     User.includes(businesses: [:resources]).find(Business.find(self.business_id).id).id
  #   end
  # end

end
