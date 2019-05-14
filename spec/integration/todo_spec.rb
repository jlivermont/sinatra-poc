require_relative '../spec_helper.rb'

describe App do
  let(:app) { App.new }

  context 'POST /api/v1/todos' do
    it 'should return a client error if the request has missing required parameters' do
      post '/api/v1/todos', {}

      expect(last_response).to be_a_bad_request
    end
  end

  context 'GET /api/v1/todos' do
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
  end
end
