require "administrate/base_dashboard"

class ReimFormMessageDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    trip: Field::BelongsTo,
    status: Field::BelongsTo,
    id: Field::Number,
    message: Field::Text,
    employee_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :trip,
    :status,
    :id,
    :message,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :trip,
    :status,
    :id,
    :message,
    :employee_id,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :trip,
    :status,
    :message,
    :employee_id,
  ].freeze

  # Overwrite this method to customize how reim form messages are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(reim_form_message)
  #   "ReimFormMessage ##{reim_form_message.id}"
  # end
end
