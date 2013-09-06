# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'archimedes/version'

Gem::Specification.new do |spec|
  spec.name          = 'archimedes'
  spec.version       = Archimedes::VERSION
  spec.authors       = ['Duncan Grazier', 'Paul Guelpa', 'Sander Hartlage']
  spec.email         = ['itsmeduncan@gmail.com', 'paul.guelpa@gmail.com', 'sander.hartlage@gmail.com']
  spec.description   = %q{A lightweight wrapper for statsd-ruby}
  spec.summary       = %q{Wrap up the configration, and usage of StatsD}
  spec.homepage      = 'https://www.github.com/shopkeep/archimedes'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'mocha', '~> 0.14.0'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.14.1'
  spec.add_development_dependency 'simplecov', '~> 0.7.1'

  spec.add_dependency 'isomer', '~> 0.1.3'
  spec.add_dependency 'statsd-ruby', '~> 1.2.1'
end
