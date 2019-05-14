require 'bundler'
require 'rack/test'
require 'rspec'
require 'rspec-parameterized'
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/param'

ENV['RACK_ENV'] = 'test'

# Pull in the app
require File.expand_path('../../app/app.rb', __FILE__)

# Pull in all controller, model and service classes
#Dir.glob('./app/{models,services,controllers}/*.rb').each { |r| require r }

Bundler.require(:default, :test)
DatabaseCleaner.strategy = :truncation

module RSpecMixin
  include Rack::Test::Methods
  def app
    described_class
  end

  def body_as_json
    json_str_to_hash(last_response.body)
  end

  def json_str_to_hash(str)
    JSON.parse(str).with_indifferent_access
  end
end

RSpec.configure do |c|
  c.include RSpecMixin

  c.before(:all) do
    DatabaseCleaner.clean
  end

  c.after(:each) do
    DatabaseCleaner.clean
  end
end
