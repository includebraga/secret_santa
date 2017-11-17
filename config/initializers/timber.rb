config = Timber::Config.instance
config.integrations.action_view.silence = Rails.env.production?
Timber.config.logrageify!()
