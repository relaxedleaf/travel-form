json.extract! reim_form_message, :id, :reimbursement_form_id, :message,:employee_id, :status_id, :created_at, :updated_at
json.url reim_form_message_url(reim_form_message, format: :json)
