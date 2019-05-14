class TodosController < ApplicationController
  get '/api/v1/todos' do
    TodoService.new.all_todos.to_json
  end

  post '/api/v1/todos' do
    param :description, String, required: true, min_length: 1
    param :completed, Boolean, required: false, default: false

    params.merge!(JSON.parse(request.body.read.to_s))
    TodoService.new.create_todo(params[:description], params[:completed]).to_json
  rescue StandardError
    return_client_error
  end

  get '/api/v1/todos/:todo_id' do
    param :todo_id, Integer, required: true, min: 1
    TodoService.new.find_todo(params[:todo_id]).to_json
  end

  patch '/api/v1/todos/:todo_id' do
    param :todo_id, Integer, required: true, min: 1
    param :description, String, required: true, min_length: 1

    params.merge!(JSON.parse(request.body.read.to_s))
    TodoService.new.update_todo(params[:todo_id], params[:description]).to_json
  rescue StandardError
    return_client_error
  end

  delete '/api/v1/todos/:todo_id' do
    param :todo_id, Integer, required: true, min: 1
    TodoService.new.remove_todo(params[:todo_id])
  end
end
