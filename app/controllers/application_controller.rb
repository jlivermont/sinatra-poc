require "sinatra/base"
require "sinatra/json"
require 'sinatra/param'

class ApplicationController < Sinatra::Base
  helpers Sinatra::Param

  error ActiveRecord::RecordNotFound do
    status 404
    { result: 'requested resource does not exist' }.to_json
  end

  def return_client_error
    status 400
    { result: 'Request payload was not properly formatted' }
  end

  # don't enable logging when running tests
  configure :production, :development do
    enable :logging
  end
end
