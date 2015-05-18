# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iso8583/version'

Gem::Specification.new do |spec|
  spec.name          = 'iso-8583'
  spec.version       = ISO8583::VERSION
  spec.authors       = ['Alejandro Gutiérrez']
  spec.email         = ['alejandrodevs@gmail.com']

  spec.summary       = 'A simple gem to work with ISO8583 standard'
  spec.description   = 'This gem allows you to work with ISO8583 (Financial transaction card originated messages).'
  spec.homepage      = 'https://github.com/alejandrogutierrez/ISO-8583'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
end
