# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem "puma", "~> 3.12"
gem "sinatra", "~> 2.0"
gem "sinatra-activerecord", "~> 2.0"
gem "sinatra-namespace", "~> 1.0"
gem "sinatra-param", "~> 1.5"

gem "pg", "~> 1.1"
gem "rake", "~> 12.3"
gem "irb", "~> 1.0"

group :test do
  gem 'rack-test'
  gem 'rspec'
  gem "rspec-parameterized", "~> 0.4.1"
  gem "rubocop", "~> 0.64.0"
  gem "database_cleaner", "~> 1.7"
end
