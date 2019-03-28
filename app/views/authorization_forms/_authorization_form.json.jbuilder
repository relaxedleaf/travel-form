json.extract! authorization_form, :id, :status_id, :employee_id, :trip_id, :created_at, :updated_at
json.url authorization_form_url(authorization_form, format: :json)
