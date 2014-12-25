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

    def initialize(options = {})
      raise ArgumentError, 'Parameter type must be Hash' unless options.class == Hash
      unless options.empty?
        raise ArgumentError, 'Parameter must contain key :open' unless options.has_key? :open
        raise ArgumentError, 'Parameter must contain key :close' unless options.has_key? :close
        raise ArgumentError, 'Parameter must contain key :did' unless options.has_key? :did

        @open, @close, @did = options[:open], options[:close], options[:did]
      end
    end

    def send(options = {})
      raise ArgumentError, 'Parameter type must be Hash' unless options.class == Hash
      raise ArgumentError, 'Parameter must contain key :to' unless options.has_key? :to
      raise ArgumentError, 'Parameter must contain key :text' unless options.has_key? :text

      @data = { did: @did, to: options[:to], text: options[:text], planned: 1 }
      resp = responce :send
      resp.body
    end

    def info(options = {})
      raise ArgumentError, 'Parameter type must be Hash' unless options.class == Hash
      raise ArgumentError, 'Parameter must contain key :mid' unless options.has_key? :mid
      @data = { mid: options[:mid] }
      resp = responce :info
      resp.body
    end

    def projects
      @data = { }
      resp = responce :projects
      resp.body
    end

    def deliveries(options = {})
      raise ArgumentError, 'Parameter type must be Hash' unless options.class == Hash
      raise ArgumentError, 'Parameter must contain key :pid' unless options.has_key? :pid

      @data = { pid: options[:pid] }
      resp = responce :deliveries
      resp.body
    end

    def test
      @data = { a: 1, b: 2 }
      resp = responce :test
      resp.body
    end

    private

    def sign
      CGI::escape(Base64.encode64(Digest::SHA256.digest("#{@close}#{@data.to_json}")).gsub(/\n/, ''))
    end

    def responce(method)
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
