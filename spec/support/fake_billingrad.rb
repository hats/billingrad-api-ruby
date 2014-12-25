require 'sinatra/base'

class FakeBillingrad < Sinatra::Base

  post '/api/delivery/createMessage' do
    json_response 200, 'send.json'
  end

  post '/api/delivery/messageInfo' do
    json_response 200, 'info.json'
  end

  post '/api/test/testSum' do
    json_response 200, 'test.json'
  end

  post '/api/project/list' do
    json_response 200, 'projects.json'
  end

  post '/api/delivery/list' do
    json_response 200, 'deliveries.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/../fixtures/' + file_name, 'rb').read
  end
end