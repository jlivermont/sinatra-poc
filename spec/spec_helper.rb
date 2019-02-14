require 'rack/test'
require 'rspec'
require 'rspec-parameterized'

ENV['RACK_ENV'] = 'test'

require File.expand_path('../service.rb', __dir__)
Dir[File.join(File.dirname(__FILE__), '../models/*.rb')].each { |r| require_relative r }

module RSpecMixin
  include Rack::Test::Methods

  def app
    Sinatra::Application
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
end
