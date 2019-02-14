require_relative '../spec_helper.rb'

RSpec.describe 'The todos resource' do
  it 'should create a new todo given a valid description (POST /todos)' do
    body = { 'description': 'this is a test todo' }
    post '/api/v1/todos', body

    expect(body_as_json['description']).to eq('this is a test todo')
    expect(body_as_json['id']).to be_a(Integer)
    expect(body_as_json.keys).to include('created_at')
  end

  it 'should return a client error if the request is missing required parameters (POST /todos)' do
    post '/api/v1/todos', {}

    expect(last_response).to be_a_bad_request
  end
end
