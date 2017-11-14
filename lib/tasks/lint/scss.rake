if %w(development test).include? Rails.env
  require "scss_lint/rake_task"

  namespace :lint do
    desc "Run SCSS Lint"
    task scss: :environment do
      SCSSLint::RakeTask.new
    end
  end
end
