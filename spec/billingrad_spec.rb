require File.expand_path('../spec_helper', __FILE__)

describe Billingrad do

  describe '.client' do
    it 'should be a Billingrad::Client' do
      expect(Billingrad.client(open: 'o', close: 'c', did:  'd')).to be_a(Billingrad::Client)
    end
  end

end