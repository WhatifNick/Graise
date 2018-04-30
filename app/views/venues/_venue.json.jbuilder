json.extract! venue, :id, :image, :name, :phone_number, :email, :website, :style, :about, :street_address, :area_id, :created_at, :updated_at
json.url venue_url(venue, format: :json)
