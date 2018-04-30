json.extract! event, :id, :image, :title, :date, :time, :about, :user_id, :venue_id, :cause_id, :created_at, :updated_at
json.url event_url(event, format: :json)
