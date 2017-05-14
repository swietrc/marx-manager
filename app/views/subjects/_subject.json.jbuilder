json.extract! subject, :id, :name, :start_date, :finish_date, :owner_id, :created_at, :updated_at
json.url subject_url(subject, format: :json)
