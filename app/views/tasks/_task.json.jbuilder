json.extract! task, :id, :titulo, :descripcion, :created_at, :updated_at
json.url task_url(task, format: :json)
