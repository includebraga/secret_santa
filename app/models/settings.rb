class Settings < ApplicationRecord
  REGISTRATIONS_ENABLED = :REGISTRATIONS_ENABLED

  validates :key, presence: true, uniqueness: true
  validates :value, presence: true

  def self.registrations_enabled?
    Settings.find_by(key: REGISTRATIONS_ENABLED)&.value == "true" || false
  end

  def self.toggle_registrations
    registrations_enabled = Settings.find_or_initialize_by(key: REGISTRATIONS_ENABLED)

    registrations_enabled.value = case registrations_enabled.value
                                  when nil, "false"
                                    "true"
                                  when "true"
                                    "false"
                                  end
    registrations_enabled.save

    registrations_enabled.value == "true"
  end

  def self.get(key)
    Settings.find_by(key: key)
  end

  def self.put(key, value)
    Settings.find_or_initialize_by(key: key).tap { |key_value| key_value.value = value.to_s }.save
  end
end