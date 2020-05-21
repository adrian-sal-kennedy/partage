class Business < ApplicationRecord
  belongs_to :user
  has_many :resources, dependent: :destroy
  has_many :agreements, dependent: :destroy
  # validates :url, url: { allow_nil: true, no_local: true }
  geocoded_by :location
  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.house_number = geo.house_number
      obj.road = geo.street
      obj.suburb = geo.suburb
      obj.county = geo.county
      obj.state = geo.state
      obj.postcode = geo.postal_code
      obj.country = geo.country
      obj.country_code = geo.country_code
    end
  end
  after_validation :geocode, :reverse_geocode if ->(obj){ obj.location.present? and obj.location_changed? }
end
