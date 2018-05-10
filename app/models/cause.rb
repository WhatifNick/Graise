class Cause < ApplicationRecord
  mount_uploader :image, ProfilePictureUploader
  has_many :users
  # has_and_belongs_to_many :users
  has_many :events

end
