json.extract! trip, :id, :destination, :purpose, :date_start, :date_end, :employee_id, :created_at, :updated_at
json.url trip_url(trip, format: :json)
