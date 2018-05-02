class Area < ApplicationRecord
geocoded_by :city_state_address
after_validation :geocode

def city_state_address
  "#{city}, #{state}, #{post_code}"
end
end
