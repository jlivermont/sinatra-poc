require_relative '../spec_helper.rb'

RSpec.describe 'The Entry model' do
  it 'should create successfully given valid parameters' do
    @todo = Todo.create!(description: 'This is a test todo list')
    @entry = @todo.entries.create(message: 'Pick up milk')

    expect(Entry.exists?(@entry.id)).to be true
  end
end
