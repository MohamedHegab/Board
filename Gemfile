source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use PostgreSQL as the database for Active Record
gem 'pg', '~> 1.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
gem 'bcrypt', '~> 3.1', '>= 3.1.12'
gem 'jwt'
gem 'active_model_serializers', '~> 0.10.7'
gem 'will_paginate', '~> 3.1', '>= 3.1.6'
gem 'faker'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'pundit', '~> 2.0'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
  gem 'pry-rails'
end

group :test do
  gem "factory_bot_rails", "~> 4.0"
  gem 'shoulda-matchers', '~> 3.1'
  gem 'database_cleaner'
  gem 'coveralls', require: false
  gem 'pundit-matchers', '~> 1.6.0'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end