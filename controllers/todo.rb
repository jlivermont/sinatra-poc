require_relative '../models/todo'

def create_todo(description)
  Todo.create(description: description)
end

def all_todos
  Todo.all
end
