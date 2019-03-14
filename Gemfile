source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.5.1"

gem "activerecord-import"
gem "administrate", github: "substancelab/administrate", branch: "276-collection_filters"
gem "bootstrap-sass", "~> 3.2.0"
gem "email_validator"
gem "foreman"
gem "google_sign_in"
gem "httparty"
gem "loofah", ">= 2.2.3"
gem "pg"
gem "pry-rails"
gem "puma"
gem "rack-cors", require: "rack/cors"
gem "rails", "~> 5.2.2"
gem "react-rails"
gem "redcarpet"
gem "sass-rails", "~> 5.0"
gem "sentry-raven"
gem "simple-line-icons-rails"
gem "slim-rails"
gem "timber", "~> 2.2"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "webpacker"

group :development, :test do
  gem "awesome_print"
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "dotenv"
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-remote"
  gem "rspec-rails", "~> 3.5.1"
  gem "rubocop", require: false
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "letter_opener"
  gem "letter_opener_web"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring", require: false
  gem "spring-watcher-listen", "~> 2.0.0", require: false
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "database_cleaner"
  gem "rails-controller-testing"
  gem "shoulda-matchers"
  gem "simplecov", require: false
end
