# frozen_string_literal: true

json.extract! task, :id, :project_id, :name, :description, :end_date, :start_date, :created_at, :updated_at
json.url task_url(task, format: :json)
