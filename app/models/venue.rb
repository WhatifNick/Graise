class Venue < ApplicationRecord
  belongs_to :area
  mount_uploader :image, ProfilePictureUploader
  has_many :events
end
