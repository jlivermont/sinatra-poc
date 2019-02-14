require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/namespace'

# Pull in all controllers
Dir.glob('controllers/*.rb').each { |r| require_relative r }

set :database, adapter: 'sqlite3', database: 'db/db.sqlite3', encoding: 'unicode'

get '/heartbeat' do
  'alive'
end

namespace '/api/v1' do
  ### /todos ###
  get '/todos' do
    all_todos.to_json
  end

  post '/todos' do
    description = params[:description]
    create_todo(description).to_json
  end

  get '/todos/:todo_id' do
    'GET /todos/:todo_id'
  end

  patch '/todos/:todo_id' do
    'PATCH /todos/:todo_id'
  end

  delete '/todos/:todo_id' do
    'DELETE /todos/:todo_id'
  end

  ### /todos/:id/entries
  get '/todos/:todos_id/entries' do
    'GET /todos/:todos_id/entries'
  end

  post '/todos/:todos_id/entries' do
    'POST /todos/:todos_id/entries'
  end

  get '/todos/:todos_id/entries/:entry_id' do
    'GET /todos/:todos_id/entries/:entry_id'
  end

  patch '/todos/:todos_id/entries/:entry_id' do
    'PATCH /todos/:todos_id/entries/:entry_id'
  end

  delete '/todos/:todos_id/entries/:entry_id' do
    'DELETE /todos/:todos_id/entries/:entry_id'
  end
end
