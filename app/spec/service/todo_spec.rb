require_relative '../spec_helper.rb'

RSpec.describe 'The todos resource' do
  it 'should create a new todo given a valid description (POST /todos)' do
    body = { 'description': 'this is a test todo' }
    post '/api/v1/todos', body

    expect(body_as_json['description']).to eq('this is a test todo')
    expect(body_as_json['id']).to be_a(Integer)
    expect(body_as_json.keys).to include('created_at')
  end

  where(:url) do
    [
      ['/api/v1/todos/abc'],
      ['/api/v1/todos/-1']
    ]
  end

  with_them do
    it 'should return a client error if the ID is missing or malformed (GET /todos/:id)' do
      get url

      expect(last_response).to be_a_bad_request
    end
  end

  it 'should return a client error if the request has missing required parameters (POST /todos)' do
    post '/api/v1/todos', {}

    expect(last_response).to be_a_bad_request
  end

  it 'should return a todo (GET /todos/:id)' do
    body = { 'description': 'this is a test todo' }
    post '/api/v1/todos', body
    todo_id = body_as_json['id']

    get '/api/v1/todos/' + todo_id.to_s
    expect(last_response).to be_ok
    expect(body_as_json['id']).to eq(todo_id)
    expect(body_as_json['description']).to eq('this is a test todo')
  end

  it 'should delete a todo (DELETE /todos/:id)' do
    body = { 'description': 'this is a test todo' }
    post '/api/v1/todos', body
    todo_id = body_as_json['id']

    delete '/api/v1/todos/' + todo_id.to_s
    expect(last_response).to be_ok

    get '/api/v1/todos/' + todo_id.to_s
    expect(last_response.status).to eq(404)
  end

  it 'should update an existing todo (PATCH /todos/:id)' do
    body = { 'description': 'this is a test todo' }
    post '/api/v1/todos', body
    todo_id = body_as_json['id']

    body = { 'description': 'updated description' }
    patch '/api/v1/todos/' + todo_id.to_s, body
    expect(last_response).to be_ok
    expect(body_as_json['description']).to eq('updated description')

    get '/api/v1/todos/' + todo_id.to_s
    expect(last_response).to be_ok
    expect(body_as_json['description']).to eq('updated description')
  end

  where(:body) do
    [
      [{ 'bad_key': 'this is a test todo' }],
      [{ 'description': '' }]
    ]
  end

  with_them do
    it 'should return a client error if the body is missing or malformed (PATCH /todos/:id)' do
      initial_body = { 'description': 'this is a test todo' }
      post '/api/v1/todos', initial_body
      todo_id = body_as_json['id']

      patch '/api/v1/todos/' + todo_id.to_s, body

      expect(last_response).to be_a_bad_request
    end
  end
end