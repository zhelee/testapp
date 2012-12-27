source 'https://rubygems.org'

gem 'rails', '3.2.9'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :assets, :development do
  gem 'therubyracer', '0.10.2'
end

group :development do
  gem 'letter_opener'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end

gem 'jquery-rails'

# Use unicorn as the app server
gem 'unicorn'

# exception notifier
gem 'exception_notification'

# jobs
gem 'delayed_job_active_record'
gem 'daemons'

# Deploy with Capistrano
gem 'capistrano'
gem 'rvm-capistrano'
