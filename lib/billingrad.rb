require 'billingrad/version'
require 'billingrad/client'

module Billingrad
  def self.client(open:, close:, did:)
    Client.new(open: open, close: close, did: did)
  end
end
