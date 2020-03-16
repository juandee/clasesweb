json.extract! user, :id, :name, :surname, :dni, :birthday, :created_at, :updated_at
json.url user_url(user, format: :json)
