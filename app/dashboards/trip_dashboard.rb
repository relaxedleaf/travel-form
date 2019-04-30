require "administrate/base_dashboard"

class TripDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    employee: Field::BelongsTo,
    reimbursement_form: Field::HasOne,
    authorization_form: Field::HasOne,
    destination: Field::HasOne,
    requests: Field::HasMany,
    reim_form_message: Field::HasMany,
    id: Field::Number,
    purpose: Field::String,
    date_start: Field::String,
    date_end: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :employee,
    :reimbursement_form,
    :authorization_form,
    :destination,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :employee,
    :reimbursement_form,
    :authorization_form,
    :destination,
    :requests,
    :reim_form_message,
    :id,
    :purpose,
    :date_start,
    :date_end,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :employee,
    :reimbursement_form,
    :authorization_form,
    :destination,
    :requests,
    :reim_form_message,
    :purpose,
    :date_start,
    :date_end,
  ].freeze

  # Overwrite this method to customize how trips are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(trip)
  #   "Trip ##{trip.id}"
  # end
end
