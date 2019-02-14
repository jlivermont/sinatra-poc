# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem "sinatra", "~> 2.0"
gem "sinatra-activerecord", "~> 2.0"
gem "sinatra-namespace", "~> 1.0"
gem "sinatra-param", "~> 1.5"

gem "sqlite3", "~> 1.3.6"
gem "rake", "~> 12.3"

group :test do
  gem 'rack-test'
  gem 'rspec'
  gem "rspec-parameterized", "~> 0.4.1"
  gem "rubocop", "~> 0.64.0"
end
