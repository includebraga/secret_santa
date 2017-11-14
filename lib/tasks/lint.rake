if %w(development test).include? Rails.env
  namespace :lint do
    desc "Run all linters"
    task all: %i(lint:ruby lint:scss)
  end
end
