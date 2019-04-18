json.extract! receipts_request, :id, : total_amount, :department_id, :reimbursement_form_id, :created_at, :updated_at
json.url receipts_request_url(receipts_request, format: :json)
