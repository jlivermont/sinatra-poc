require 'sinatra'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "db", encoding: "unicode", file: "db.sqlite3"}

get "/" do
  'Hello world'
end
