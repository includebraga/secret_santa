source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.4.2"

gem "foreman"
gem "pg"
gem "pry-rails"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.3"
gem "sass-rails", "~> 5.0"
gem "slim-rails"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "awesome_print"
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails"
  gem "pry-byebug"
  gem "pry-remote"
  gem "rspec-rails", "~> 3.5.1"
  gem "rubocop", "0.43.0", require: false
  gem "scss_lint", require: false
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring", require: false
  gem "spring-watcher-listen", "~> 2.0.0", require: false
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "database_cleaner"
  gem "shoulda-matchers"
  gem "simplecov", require: false
end
