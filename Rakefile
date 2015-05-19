# coding: utf-8
require 'bundler/gem_tasks'

desc 'Run tests'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

desc 'Default task'
task :default do
  require_relative 'lib/billingrad'

  options = JSON.parse File.open('keys.json', 'r'){ |file| file.read }
  open_api_key  = options['open']
  close_api_key = options['close']
  project_id    = options['pid']
  delivery_id   = options['did']
  message_id    = options['mid']
  phone         = options['phone']
  text          = options['text']

  client = Billingrad::Client.new(
      open: open_api_key,
      close: close_api_key,
      did:  delivery_id
  )

  # p 'Print test method:'
  # p client.test
  # p 'Print projects method:'
  # p client.projects
  # p 'Print deliveries method:'
  # p client.deliveries pid: project_id
  # p 'Print send method:'
  # res =  client.send_message(
  #           to: phone,
  #           text: text
  # )
  # p res
  p 'Print info method:'
  p client.status mid: 250812

end
