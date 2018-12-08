require "administrate/base_dashboard"

class ReceiverDashboard < Administrate::BaseDashboard
  COLLECTION_FILTERS = {
    golden: ->(resources) { resources.golden },
    normal: ->(resources) { resources.normal }
  }.freeze

  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    matches: Field::HasMany,
    unreceived_matches: Field::HasMany,
    users: Field::HasMany,
    institution: Field::BelongsTo.with_options(
      searchable: true,
      searchable_field: "name",
    ),
    id: Field::Number,
    name: Field::String,
    letter: Field::Text,
    golden: Field::Boolean,
    age: Field::Number,
    gender: SelectField.with_options(choices: Receiver.genders.keys),
    observations: Field::Text.with_options(searchable: true),
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    name
    institution
    golden
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    age
    gender
    institution
    golden
    letter
    observations
    matches
    unreceived_matches
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    institution
    name
    age
    gender
    golden
    letter
    observations
  ].freeze

  def display_resource(receiver)
    "🙈 #{receiver.institution.short_name}#{receiver.id}"
  end
end
