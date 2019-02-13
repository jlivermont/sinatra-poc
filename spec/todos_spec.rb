require_relative 'spec_helper.rb'

RSpec.describe 'Specing the todo service' do
  it 'should be alive' do
    get '/heartbeat'

    expect(last_response).to be_ok
    expect(last_response.body).to eq('alive')
  end
end
