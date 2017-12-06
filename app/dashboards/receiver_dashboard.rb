require "administrate/base_dashboard"

class ReceiverDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    matches: Field::HasMany,
    users: Field::HasMany,
    instituition: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    letter: Field::Text,
    matched_gifts: Field::Number,
    received_gifts: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    name
    instituition
    matched_gifts
    received_gifts
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    name
    instituition
    matched_gifts
    received_gifts
    letter
    matches
    users
    id
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    instituition
    name
    letter
    matched_gifts
    received_gifts
  ].freeze

  def display_resource(receiver)
    "🙈 ##{receiver.id}"
  end
end
