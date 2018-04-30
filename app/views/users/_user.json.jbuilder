json.extract! user, :id, :image, :first_name, :last_name, :email, :phone_number, :bio, :area_id, :created_at, :updated_at
json.url user_url(user, format: :json)
