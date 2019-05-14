require_relative '../spec_helper.rb'

RSpec.describe 'The service' do
  it 'should return a Content-Type header of application/json' do
    get '/heartbeat'

    expect(last_response.headers['Content-Type']).to eq('application/json')
  end
end
