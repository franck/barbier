source 'https://rubygems.org'

gem 'rails', '3.2.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'sqlite3'

gem "delocalize" # date/time parsing
gem "redcarpet"
#gem 'kaminari', '0.13.0'
gem 'will_paginate', '~> 3.0'
gem 'bootstrap-will_paginate'
gem "paperclip", "~> 2.0"
gem "fb_graph"
#gem "rmagick"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sprockets'
  gem 'sass-rails'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass', '~> 2.0.4.0'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-ui-rails'
end

gem 'jquery-rails'
gem 'rails-i18n'

gem "rspec-rails", :group => [:test, :development] 
group :test do   
  gem "factory_girl_rails"   
  gem "capybara"
  gem "launchy"
  #gem "capybara-webkit"
  gem 'database_cleaner'
  gem "guard-rspec"
  gem "spork"
  gem 'rb-fsevent'
  gem "guard-spork"
  gem "turn", :require => false
  gem "faker"
end

group :development do
  gem 'capistrano', '~> 3.2.0'
  gem 'capistrano-rails',   '~> 1.1', require: false
  gem 'capistrano-bundler', '~> 1.1', require: false
end



