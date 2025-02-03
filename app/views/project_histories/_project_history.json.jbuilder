json.extract! project_history, :id, :project_id, :user_id, :comment, :status_before, :status_after, :created_at, :updated_at
json.url project_history_url(project_history, format: :json)
