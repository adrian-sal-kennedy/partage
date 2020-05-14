class Business < ApplicationRecord
  validates :url, url: { allow_nil: true, no_local: true }
  geocoded_by :location
  after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }
end
