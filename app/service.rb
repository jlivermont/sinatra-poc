require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/param'
require 'sinatra/namespace'

# Pull in all controllers
Dir.glob('controllers/*.rb').each { |r| require_relative r }

set :database, adapter: 'sqlite3', database: 'db/db.sqlite3', encoding: 'unicode'

before do
  content_type 'application/json'
end

get '/heartbeat' do
  'alive'
end

error ActiveRecord::RecordNotFound do
  status 404
  { result: 'requested resource does not exist' }.to_json
end

namespace '/api/v1' do
  ### /todos ###
  get '/todos' do
    all_todos.to_json
  end

  post '/todos' do
    params.merge!(JSON.parse(request.body.read.to_s))
    param :description, String, required: true, min_length: 1
    create_todo(params[:description]).to_json
  end

  get '/todos/:todo_id' do
    param :todo_id, Integer, required: true, min: 1
    find_todo(params[:todo_id]).to_json
  end

  patch '/todos/:todo_id' do
    params.merge!(JSON.parse(request.body.read.to_s))
    param :todo_id, Integer, required: true, min: 1
    param :description, String, required: true, min_length: 1
    update_todo(params[:todo_id], params[:description]).to_json
  end

  delete '/todos/:todo_id' do
    param :todo_id, Integer, required: true, min: 1
    remove_todo(params[:todo_id])
  end

  ### /todos/:id/entries
  get '/todos/:todos_id/entries' do
    param :todo_id, Integer, required: true, min: 1
    all_entries_for_todo(params[:todo_id])
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