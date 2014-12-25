require 'billingrad/version'
require 'billingrad/client'

module Billingrad
  def self.client(options={})
    Client.new(options)
  end
end
