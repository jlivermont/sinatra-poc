require_relative 'spec_helper.rb'

RSpec.describe 'The service' do
  it 'should create a new todo given a valid description' do
    body = { 'description': 'this is a test todo' }
    post '/api/v1/todos', body

    expect(body_as_json['description']).to eq('this is a test todo')
    expect(body_as_json['id']).to be_a(Integer)
    expect(body_as_json.keys).to include('created_at')
  end

  it 'should return alive if it is alive' do
    get '/heartbeat'

    expect(last_response).to be_ok
    expect(last_response.body).to eq('alive')
  end
end
