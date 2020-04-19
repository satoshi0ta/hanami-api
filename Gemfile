# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'hanami', '~> 1.3'
gem 'hanami-model', '~> 1.3'
gem 'mysql2'
gem 'bcrypt'

group :development do
  # Code reloading
  # See: https://guides.hanamirb.org/projects/code-reloading
  gem 'hanami-webconsole'
  gem 'shotgun', platforms: :ruby
end

group :test, :development do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv'
  gem 'rubocop'
  gem 'rubocop-rspec'
end

group :test do
  gem 'rspec'
end

group :production do
  # gem 'puma'
end
