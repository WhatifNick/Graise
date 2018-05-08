class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, :last_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :causes
  mount_uploader :image, ProfilePictureUploader
  has_many :events


  # after_create :set_role
  #
  #     def set_role
  #       add_role :host
  #     end

    def can_create_event?
        self.has_role?(:admin) || self.has_role?(:venue)
      end

      def can_update_event?(event)
        self.has_role?(:admin) || (self.has_role?(:host) && post.user == self) || (self.has_role?(:venue) && post.user == self)
      end

      def can_delete_event?(event)
        self.has_role?(:admin) || (self.has_role?(:venue) && post.user == self)
      end

  #
   # after_create :set_area
  #
  # def set_area
  #   self.area = Area.create
  # end
end
