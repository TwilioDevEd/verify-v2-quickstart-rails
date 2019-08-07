json.extract! user, :id, :username, :phone_number, :verified, :created_at, :updated_at
json.url user_url(user, format: :json)
