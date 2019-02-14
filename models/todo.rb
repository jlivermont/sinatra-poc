class Todo < ActiveRecord::Base
  has_many :entries, dependent: :destroy
end
