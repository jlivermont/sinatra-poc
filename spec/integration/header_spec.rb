require_relative '../spec_helper.rb'

describe App do
  let(:app) { App.new }

  context 'GET /heartbeat' do
    let(:response) { get '/heartbeat' }

    it 'returns status 200 OK' do
      expect(response.status).to eq 200
    end

		it 'returns a JSON Content-Type header' do
			expect(response.headers['Content-Type']).to eq('application/json')
		end
	end
end
