require "administrate/base_dashboard"

class MatchDashboard < Administrate::BaseDashboard
  COLLECTION_FILTERS = {
    received: ->(resources) { resources.received },
    not_received: ->(resources) { resources.not_received }
  }.freeze

  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo.with_options(
      searchable: true,
      searchable_field: "email",
    ),
    receiver: Field::BelongsTo,
    id: Field::Number,
    code: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    received: Field::Boolean
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    user
    receiver
    code
    received
    created_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    user
    receiver
    id
    code
    created_at
    updated_at
    received
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    user
    receiver
    received
  ].freeze

  # Overwrite this method to customize how matches are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(match)
    "🎁 ##{match.id}"
  end
end
