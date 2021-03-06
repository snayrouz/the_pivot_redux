source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.3'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap', '~> 4.0.0.beta'
gem 'jquery-rails'
gem 'friendly_id', '~> 5.1.0'
gem "paperclip", "~> 5.0.0"
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-google-oauth2'
gem 'chart-js-rails'
gem 'twilio-ruby'
gem 'figaro'
gem 'active_model_serializers'
gem 'literate_randomizer'
gem 'faker'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'rspec-pride', '~> 3.2', '>= 3.2.1'
  gem 'pry-rails'
  gem 'capybara'
  gem "factory_bot_rails"
  gem 'database_cleaner'
  gem 'pry'
  gem 'shoulda-matchers'
  gem 'launchy'
  gem 'factory_girl'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
