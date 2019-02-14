require 'sinatra'
require 'sinatra/activerecord'

set :database, {adapter: 'sqlite3', database: 'db/db.sqlite3', encoding: 'unicode'}

### /todos ###
get '/todos' do
  'GET /todos'
end

post '/todos' do
  'POST /todos'
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

get '/heartbeat' do
  'alive'
end
