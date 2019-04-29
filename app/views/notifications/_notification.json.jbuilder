json.extract! notification, :id, :status_id, :trip_id, :form, :created_at, :updated_at
json.url notification_url(notification, format: :json)
