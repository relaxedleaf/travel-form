require "administrate/base_dashboard"

class ReceiptDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    expense_type: Field::BelongsTo,
    receipts_request: Field::BelongsTo,
    reimbursement_form: Field::BelongsTo,
    id: Field::Number,
    image: Field::String,
    location: Field::String,
    cost: Field::String.with_options(searchable: false),
    receipt_date: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :expense_type,
    :receipts_request,
    :reimbursement_form,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :expense_type,
    :receipts_request,
    :reimbursement_form,
    :id,
    :image,
    :location,
    :cost,
    :receipt_date,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :expense_type,
    :receipts_request,
    :reimbursement_form,
    :image,
    :location,
    :cost,
    :receipt_date,
  ].freeze

  # Overwrite this method to customize how receipts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(receipt)
  #   "Receipt ##{receipt.id}"
  # end
end
