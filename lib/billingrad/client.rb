require 'base64'
require 'digest'
require 'json'
require 'faraday'
require 'faraday_middleware'

module Billingrad
  class Client

    @@host = 'http://my.billingrad.com/api'.freeze
    @@methods = {
        send: 'delivery/createMessage',
        info: 'delivery/messageInfo',
        test: 'test/testSum',
        projects: 'project/list',
        deliveries: 'delivery/list'
    }.freeze

    attr_accessor :open, :close, :did

    def initialize(open:, close:, did:)
      @open, @close, @did = open, close, did
    end

    def send_message(to:, text:)
      @data = { did: @did, to: to, text: text, planned: 1 }
      resp = response :send
      resp.body
    end

    def info(mid:)
      @data = { mid: mid }
      resp = response :info
      resp.body
    end

    def projects
      @data = { }
      resp = response :projects
      resp.body
    end

    def deliveries(pid:)
      @data = { pid: pid }
      resp = response :deliveries
      resp.body
    end

    def test
      @data = { a: 1, b: 2 }
      resp = response :test
      resp.body
    end

    private

    def sign
      CGI::escape(Base64.encode64(Digest::SHA256.digest("#{@close}#{@data.to_json}")).gsub(/\n/, ''))
    end

    def response(method)
      conn = Faraday.new(url: @@host) do |faraday|
        faraday.request  :json
        faraday.response :json, :content_type => /\bjson$/
        # faraday.response :logger
        faraday.response :raise_error
        faraday.adapter  Faraday.default_adapter
      end
      conn.post do |req|
        req.url "#{@@methods[method]}?_open=#{@open}&_key=#{sign}"
        req.body = @data.to_json
      end
    end

  end
end
