class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :first_name, :last_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :area
  has_and_belongs_to_many :causes
  has_many :events

  #
   # after_create :set_area
  #
  # def set_area
  #   self.area = Area.create
  # end
end
