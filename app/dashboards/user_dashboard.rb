require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    matches: Field::HasMany,
    receivers: ReceiverField,
    id: Field::Number,
    email: Field::String,
    confirmed_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    name: Field::String,
    observations: Field::Text.with_options(searchable: true),
    confirmation_token: Field::String,
    match_notice_sent: Field::Boolean
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    email
    name
    observations
    confirmed_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    matches
    email
    name
    observations
    confirmed_at
    created_at
    updated_at
    confirmation_token
    match_notice_sent
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    email
    name
    observations
  ].freeze

  def display_resource(user)
    "#{user.name} - #{user.email}"
  end
end
