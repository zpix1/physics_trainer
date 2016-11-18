json.extract! task, :id, :template, :variables, :formula, :created_at, :updated_at
json.url task_url(task, format: :json)