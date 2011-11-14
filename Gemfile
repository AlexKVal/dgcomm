source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem 'sqlite3', '1.3.4'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.1.4'
  gem 'coffee-rails', '3.1.1'
  gem 'uglifier',     '1.0.4'
end

gem 'jquery-rails', '1.0.17'
gem 'haml-rails', '0.3.4'

gem 'rspec-rails', '2.7.0', :group => [:development, :test]

group :development do
  gem 'guard-livereload'
end

group :test do
  gem "factory_girl_rails", '1.3.0'
  gem "cucumber-rails", '1.2.0'
  gem 'database_cleaner', '0.6.7'
  gem "capybara", '1.1.1'
  gem "launchy", '2.0.5' # Launchy.open( "http://www.ruby-lang.org" )

  gem 'spork', '0.9.0.rc9' # v 1.0 has bug "undefined method `World' for main:Object"
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'rb-fsevent'
  gem 'growl'
  
#  gem 'autotest'#, '4.4.6'
#  gem 'autotest-rails-pure'#, '4.1.2'
#  gem 'autotest-fsevent'#, '0.2.4'
#  gem 'autotest-growl'#, '0.2.9'
end
