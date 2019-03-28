json.extract! receipt, :id, :image, :reimbursement_form_id, :location, :cost, :receipt_date, :expense_type_id, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
