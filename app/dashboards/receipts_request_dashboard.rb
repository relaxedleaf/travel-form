require "administrate/base_dashboard"

class ReceiptsRequestDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    department: Field::BelongsTo,
    status: Field::BelongsTo,
    reimbursement_forms: Field::BelongsTo.with_options(class_name: "ReimbursementForms"),
    receipts: Field::HasMany,
    id: Field::Number,
    total_amount: Field::String.with_options(searchable: false),
    reimbursement_form_id: Field::Number,
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
    :status,
    :reimbursement_forms,
    :receipts,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :department,
    :status,
    :reimbursement_forms,
    :receipts,
    :id,
    :total_amount,
    :reimbursement_form_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :department,
    :status,
    :reimbursement_forms,
    :receipts,
    :total_amount,
    :reimbursement_form_id,
  ].freeze

  # Overwrite this method to customize how receipts requests are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(receipts_request)
  #   "ReceiptsRequest ##{receipts_request.id}"
  # end
end
