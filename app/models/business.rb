class Business < ApplicationRecord
  belongs_to :user
  has_many :resource, dependent: :destroy
  has_many :agreement, dependent: :destroy
  # validates :url, url: { allow_nil: true, no_local: true }
  geocoded_by :location
  after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }
end
