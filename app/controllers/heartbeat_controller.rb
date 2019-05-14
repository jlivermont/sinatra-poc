class HeartbeatController < ApplicationController
  get '/heartbeat' do
    status 200
    json :status => 'alive'
  end
end
