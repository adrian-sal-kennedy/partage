class Business < ApplicationRecord
  validates :url, url: { allow_nil: true, no_local: true }
end
