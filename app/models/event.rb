class Event < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  belongs_to :cause
  mount_uploader :image, ProfilePictureUploader
end
