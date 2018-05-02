class Cause < ApplicationRecord
  mount_uploader :image, ProfilePictureUploader

  has_and_belongs_to_many :users
end
