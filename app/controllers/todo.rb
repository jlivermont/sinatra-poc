require_relative '../models/todo'

def create_todo(description)
  Todo.create(description: description)
end

def all_todos
  Todo.all
end

def all_entries_for_todo(id)
  todo = find_todo(id)
  todo.entries
end

def find_todo(id)
  Todo.find(id)
end

def update_todo(id, description)
  todo = find_todo(id)
  todo.description = description
  todo.save!
  todo
end

def remove_todo(id)
  Todo.destroy(id)
end
