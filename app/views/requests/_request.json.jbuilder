json.extract! request, :id, :trip_id, :amount, :department_id, :created_at, :updated_at
json.url request_url(request, format: :json)
