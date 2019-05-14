class EntryService
  def create_entry(todo_id, message, completed=false)
    Entry.create(todo: todo_id, message: message, completed: completed)
  end

  def find_entry(id)
    Entry.find(id)
  end

  def update_entry(id, message)
    entry = find_entry(id)
    entry.message = message
    entry.save!
    entry
  end

  def remove_entry(id)
    Entry.destroy(id)
  end
end
