source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'graphql'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'bcrypt', '~> 3.1.7'
gem 'jwt'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem 'bootsnap', '>= 1.4.4', require: false

gem 'slim'
gem 'simple_form'
gem 'rubocop'
gem 'interactor'
gem 'sidekiq'
gem "pundit", "~> 2.1"

group :development, :test do
  gem 'byebug'

  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'simplecov', require: false
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'rubocop'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem "letter_opener"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "action_policy-graphql"
gem 'graphiql-rails', group: :development
group :test do
  gem 'rspec-rails', '~> 5.0.0'
end
