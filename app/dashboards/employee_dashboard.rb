require "administrate/base_dashboard"

class EmployeeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    department: Field::BelongsTo,
    trips: Field::HasMany,
    authorization_forms: Field::HasMany,
    reimbursement_forms: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String,
    fname: Field::String,
    lname: Field::String,
    ssn: Field::Number,
    bdate: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :department,
    :trips,
    :authorization_forms,
    :reimbursement_forms,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :department,
    :trips,
    :authorization_forms,
    :reimbursement_forms,
    :id,
    :email,
    :encrypted_password,
    :fname,
    :lname,
    :ssn,
    :bdate,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :department,
    :trips,
    :authorization_forms,
    :reimbursement_forms,
    :email,
    :encrypted_password,
    :fname,
    :lname,
    :ssn,
    :bdate,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
  ].freeze

  # Overwrite this method to customize how employees are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(employee)
  #   "Employee ##{employee.id}"
  # end
end
