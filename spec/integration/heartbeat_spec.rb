require_relative '../spec_helper.rb'

describe App do
  let(:app) { App.new }

  context 'GET /heartbeat' do
    it 'returns status 200 OK' do
      get '/heartbeat'
      expect(last_response.status).to eq 200
    end

		it 'returns a JSON payload' do
      get '/heartbeat'
      expect(body_as_json['status']).to eq('alive')
		end
	end
end
