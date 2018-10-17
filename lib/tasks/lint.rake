if %w[development test].include? Rails.env
  namespace :lint do
    desc "Run all linters"
    task all: %i[lint:ruby eslint stylelint]

    desc "Run ESLint"
    task eslint: :environment do
      puts "Running eslint"
      success = system "yarn lint"
      exit 1 unless success
    end

    desc "Run stylelint"
    task stylelint: :environment do
      puts "Running stylelint"
      success = system "yarn lint-styles"
      exit 1 unless success
    end
  end
end
