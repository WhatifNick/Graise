class Venue < ApplicationRecord
  belongs_to :area
  has_many :events
end
