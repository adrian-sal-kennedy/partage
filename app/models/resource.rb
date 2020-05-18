class Resource < ApplicationRecord
  belongs_to :business
  has_many :agreements, dependent: :destroy
end
