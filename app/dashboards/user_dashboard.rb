require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    letter: Field::BelongsTo,
    id: Field::Number,
    email: Field::String,
    confirmed_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    name: Field::String,
    confirmation_token: Field::String,
    redeemed_at: Field::DateTime,
    delivered_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    letter
    id
    email
    confirmed_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    letter
    id
    email
    confirmed_at
    created_at
    updated_at
    name
    confirmation_token
    redeemed_at
    delivered_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    letter
    email
    confirmed_at
    name
    confirmation_token
    redeemed_at
    delivered_at
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    "User ##{user.name}"
  end
end
