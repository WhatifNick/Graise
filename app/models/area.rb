class Area < ApplicationRecord
  has_many :users
  has_many :venues
  validates :city, :state, :country, :post_code, presence: true
end
