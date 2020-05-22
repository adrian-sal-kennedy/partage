class Agreement < ApplicationRecord
  belongs_to :resource
  belongs_to :business

  #FIXME: need to validate price field.
end
