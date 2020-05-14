class Agreement < ApplicationRecord
  belongs_to :resource
  belongs_to :business
end
