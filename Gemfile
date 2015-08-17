source 'https://rubygems.org'

ruby '2.2.1'

gem 'rails', '4.2.1'
gem 'pg'
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
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

gem 'responders'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'foundation-rails'
gem 'zurb-foundation', group: :production # uninitialized constant Foundation::Rails::Generators (NameError)
gem 'foundation_rails_helper'
gem 'color_routes'
gem 'traceroute'
gem 'paperclip'
gem 'aws-sdk'
gem 'aasm'

gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'capybara'
  gem 'launchy'
  gem 'awesome_print'
  gem 'better_errors'
  gem 'rspec-rails'
  gem 'web-console', '~> 2.0'
end

group :assets do
  gem 'foundation-icons-sass-rails'
end

group :production do
  gem 'puma'
end

