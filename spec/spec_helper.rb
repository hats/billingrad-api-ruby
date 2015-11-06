require 'webmock/rspec'
require File.expand_path('../support/fake_billingrad', __FILE__)
require File.expand_path('../../lib/billingrad', __FILE__)

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:any, /my.billingrad.ru/).to_rack(FakeBillingrad)
  end
end
