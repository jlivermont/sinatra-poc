require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'

# Define where the DB config is
set :database_file, File.join(File.dirname(__FILE__), '../app/config/database.yml')

#set :raise_errors, false

# Pull in all controller, model and service classes
Dir.glob('./app/{models,services,controllers}/*.rb').sort.each { |r| require r }

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  before do
    content_type 'application/json'
  end

  use HeartbeatController
  use TodosController
  use EntriesController
end
