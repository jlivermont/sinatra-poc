require_relative '../spec_helper.rb'

RSpec.describe 'The Todo model' do
  it 'should create successfully given valid parameters' do
    todo = Todo.create(description: 'This is a test todo list')
    expect(Todo.exists?(todo.id)).to be true
  end
end
