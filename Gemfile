source 'https://rubygems.org'

gem 'rails', '3.2.8'

group :development, :test do
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.11.0'
  gem 'guard-rspec', '1.2.1'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails', '2.0.2'

group :test do
  gem 'capybara', '1.1.2'

  # Linux
  gem 'rb-inotify', '0.8.8'
  gem 'libnotify', '0.5.9'

  # OS X
  #gem 'rb-fsevent', '0.9.1', :require => false
  #gem 'growl', '1.0.3'
end

group :production do
  gem 'pg', '0.12.2'
end

