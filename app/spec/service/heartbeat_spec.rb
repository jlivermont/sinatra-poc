require_relative '../spec_helper.rb'

RSpec.describe 'The service heartbeat' do
  it 'should return alive if it is alive' do
    get '/heartbeat'

    expect(last_response).to be_ok
    expect(last_response.body).to eq('alive')
  end
end
