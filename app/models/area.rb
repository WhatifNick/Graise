class Area < ApplicationRecord
  geocoded_by :city_state_address
  after_validation :geocode
  has_many :users
  has_many :venues
  validates :city, :state, :country, :post_code, presence: true
  def city_state_address
    "#{city}, #{state}, #{post_code}"
  end

end
