source 'http://rubygems.org'
ruby "2.0.0"

# gem 'rails', '3.2.8'

# Bundle edge Rails instead:
#gem 'activerecord-deprecated_finders', :git => 'git://github.com/rails/activerecord-deprecated_finders.git'
gem 'rails', '4.0.0'
#gem 'journey', :git => 'git://github.com/rails/journey.git'
gem 'pg'
gem 'unicorn'
gem 'redcarpet'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
#  gem 'sass-rails'
#  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'simplecov', :require => false, :group => :test

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem "factory_girl_rails", "~> 3.0"
#  gem 'debugger'
  gem 'fuubar'
end
