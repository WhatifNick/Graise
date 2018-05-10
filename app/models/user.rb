class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, :last_name, :city, :state, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :cause
  # has_and_belongs_to_many :causes
  # has_one :cause
  mount_uploader :image, ProfilePictureUploader
  has_many :events
  has_many :requests
  has_one :venue
  geocoded_by :city_state_address


  def can_create_event?
    self.has_role?(:admin) || self.has_role?(:venue)
  end

  def can_update_event?(event)
    self.has_role?(:admin) || (self.has_role?(:host) && event.user_id == self.id) || (self.has_role?(:venue) && event.venue.user_id == self.id)
  end

  def can_delete_event?(event)
    self.has_role?(:admin) || (self.has_role?(:venue) && event.user_id == self.id)
  end

  def can_create_venue?
      (self.has_role?(:admin) || self.has_role?(:venue))
    end

  def can_update_venue?(venue)
    self.has_role?(:admin) || (self.has_role?(:venue) && venue.user_id == self.id)
  end

  def can_delete_venue?(venue)
    self.has_role?(:admin) || (self.has_role?(:venue) && venue.user_id == self.id)
  end

  def city_state_address
    "#{city}, #{state}"
  end

end
