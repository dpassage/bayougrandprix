source 'http://rubygems.org'
ruby "2.1.2"

gem 'rails', '4.0.5'
gem 'pg'
gem 'unicorn'
gem 'redcarpet'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
 gem 'sass-rails'
 gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'simplecov', :require => false, :group => :test

gem 'rails_12factor', group: :production
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
