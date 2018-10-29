class Settings < ApplicationRecord
  validates :key, presence: true, uniqueness: true
  validates :value, presence: true

  def self.registrations_enabled?
    Settings.find_by(key: :REGISTRATIONS_ENABLED)&.value == "true" || false
  end

  def self.toggle_registrations
    registrations_enabled = Settings.find_or_initialize_by(key: :registrations_enabled)
    registrations_enabled.value = "false" unless registrations_enabled.value

    registrations_enabled.value = registrations_enabled.value == "true" ? "false" : "true"
    registrations_enabled.save

    registrations_enabled.value == "true"
  end
end
