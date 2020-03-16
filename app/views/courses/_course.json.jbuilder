json.extract! course, :id, :name, :descripcion, :created_at, :updated_at
json.url course_url(course, format: :json)
