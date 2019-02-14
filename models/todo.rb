# Todo model which has a one-to-many relationship with Entry
class Todo < ActiveRecord::Base
  has_many :entries, dependent: :destroy
end
