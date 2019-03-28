json.extract! reimbursement_form, :id, :status_id, :employee_id, :trip_id, :created_at, :updated_at
json.url reimbursement_form_url(reimbursement_form, format: :json)
