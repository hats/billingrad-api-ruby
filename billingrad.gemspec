# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'billingrad/version'

Gem::Specification.new do |spec|
  spec.name          = 'billingrad-api-ruby'
  spec.version       = Billingrad::VERSION
  spec.author        = 'Pavel Bozhenik'
  spec.email         = 'bozhenik[at]gmail[dot]com'
  spec.summary       = 'Обертка над API для сервиса рассылок Billingrad.com на Ruby.'
  spec.description   = 'Обертка над API для сервиса рассылок Billingrad.com на Ruby.'
  spec.homepage      = 'https://github.com/hats/billingrad-api-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'webmock', '~> 1.20'
  spec.add_development_dependency 'sinatra', '~> 1.4'

  spec.add_dependency 'faraday', '~> 0.9'
  spec.add_dependency 'faraday_middleware', '~> 0.9'
end
