# Entry model
class Entry < ActiveRecord::Base
  belongs_to :todo, required: true
end
