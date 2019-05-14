class EntriesController < ApplicationController
  get '/api/v1/todos/:todos_id/entries' do
    param :todo_id, Integer, required: true, min: 1
    TodoService.new.all_entries_for_todo(params[:todo_id])
  end

  post '/api/v1/todos/:todos_id/entries' do
    param :todo_id, Integer, required: true, min: 1
    param :message, String, required: true, min_length: 1
    param :done, Boolean, required: false, default: false

    params.merge!(JSON.parse(request.body.read.to_s))
    EntryService.new.create_entry(todo_id, message, done = false)
  rescue StandardError
    return_client_error
  end

  get '/api/v1/todos/:todos_id/entries/:entry_id' do
    param :todo_id, Integer, required: true, min: 1
    EntryService.new.find_entry(entry_id)
  end

  patch '/api/v1/todos/:todos_id/entries/:entry_id' do
    param :todo_id, Integer, required: true, min: 1
    param :message, String, required: true, min_length: 1
    param :done, Boolean, required: false, default: false

    params.merge!(JSON.parse(request.body.read.to_s))
    EntryService.new.update_entry(entry_id, message, done)
  rescue StandardError
    return_client_error
  end

  delete '/api/v1/todos/:todos_id/entries/:entry_id' do
    param :todo_id, Integer, required: true, min: 1
    EntryService.new.remove_entry(entry_id)
  end
end
