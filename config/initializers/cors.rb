if Rails.env.production?
  Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'natal.includebraga.org'
      resource '*',
        headers: :any,
        methods: %i(get post put patch delete options head)
    end
  end
end