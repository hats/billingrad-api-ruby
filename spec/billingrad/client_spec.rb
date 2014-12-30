require File.expand_path('../../spec_helper', __FILE__)

describe Billingrad::Client do

  context '.new' do

    before do
      @client = Billingrad::Client.new open: 'open-key', close: 'close-key', did: 'delivery-id'
    end

    describe '.test' do
      it 'should return an array with correct test data' do
        expect(@client.test['data']['sum']).to eq(3)
      end
    end

    describe '.projects' do
      it 'should return an array with correct project data' do
        expect(@client.projects['data'][0]['id']).to eq('df554239ebdc00553963a9ee7d64b406')
      end
    end

    describe '.deliveries' do
      it 'should return an array with correct delivery data' do
        expect(@client.deliveries(pid: 'project-id')['data'][2]['did']).to eq(90)
      end
    end

    describe '.send_message' do
      it 'should return an array with correct message id' do
        expect(@client.send_message(to: 'phone-number', text: 'test message')['data']).to eq(6008.to_s)
      end
    end

    describe '.info' do
      it 'should return an array with correct message info data' do
        expect(@client.info(mid: 'message-id')['data']['deliveryCount']).to eq(1)
      end
    end

  end

end