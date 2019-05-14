require_relative '../models/entry'

def create_entry(todo_id, message, done = false)
  Entry.create(message: message, done: done, todo_id: todo_id)
end

def all_entries_for_todo(id)
  find_entry(id).entities
end

def find_entry(id)
  Entry.find(id)
end

def update_entry(id, message = nil, done = nil)
  entry = find_entry(id)

  entry.message = message unless message.nil?
  entry.done = done unless done.nil?
  entry.save!
  entry
end

def remove_entry
  Entry.destroy(id)
end
