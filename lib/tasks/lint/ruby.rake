if %w(development test).include? Rails.env
  namespace :lint do
    require "rubocop/rake_task"
    RuboCop::RakeTask.new(:ruby)
  end
end
