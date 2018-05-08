class Venue < ApplicationRecord
  mount_uploader :image, ProfilePictureUploader
  has_many :events
  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def full_street_address
    "#{street_address}, #{city}, #{state}, #{post_code}"
  end
end
