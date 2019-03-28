json.extract! employee, :id, :department_id, :email, :fname, :lname, :ssn, :bdate, :manager_ssn, :created_at, :updated_at
json.url employee_url(employee, format: :json)
