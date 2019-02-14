require_relative '../spec_helper.rb'

RSpec.describe 'Specing the Todo model' do
  it 'should create' do
    todo = Todo.create(description: 'This is a test todo list')
    expect(Todo.exists?(todo.id)).to be true
  end
end
