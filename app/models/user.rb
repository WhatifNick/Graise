class User < ApplicationRecord
  belongs_to :area
  has_and_belongs_to_many :causes
  mount_uploader :image, ProfilePictureUploader
end
