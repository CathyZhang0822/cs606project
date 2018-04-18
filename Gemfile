source 'https://rubygems.org'

ruby '2.3.0'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use sqlite3 as the database for Active Record
gem 'bcrypt', '~> 3.1.7'
#gem 'sqlite3'
# Add Pagiation to Views
gem 'will_paginate', '3.0.7'
gem 'bootstrap-will_paginate', '0.0.10'
# Use SCSS for stylesheets
gem 'bootstrap-sass', '~> 3.3.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Use ransack for Search 
gem 'ransack'
# Use for backgroud processing
gem 'sidekiq'
# Redis-backed Ruby library for creating background jobs
gem 'resque'
# A light-weight job scheduling system built on top of resque
gem 'resque-scheduler'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'figaro'
# Use Unicorn as the app server
# gem 'unicorn'
gem 'mailgun-ruby', '~>1.0.2', require: 'mailgun'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  # Access an IRB console on exception pages or by using <%= console %> in views
  #gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  #gem 'spring'
end

group :production do
  gem 'pg', '~>0.11'
  gem 'rails_12factor'
end

group :test do
  gem "faker", "~> 1.4.3"
  gem 'simplecov', :require => false
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  gem "factory_girl_rails", "~> 4.4.1"
end

group :development do
  gem "factory_girl_rails", "~> 4.4.1"
  gem 'web-console', '~> 2.0'       
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
end