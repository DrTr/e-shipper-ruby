# -*- encoding: utf-8 -*-
require File.expand_path('../lib/e_shipper_ruby/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'e_shipper_ruby'
  gem.version       = EShipperRuby::VERSION
  gem.authors       = ['Daniel Gonzalez']
  gem.email         = ['dangt85@gmail.com']
  gem.description   = %q{e-shipper API client}
  gem.summary       = %q{e-shipper shipping service XML API wrapper for Ruby}
  gem.homepage      = 'https://github.com/HealthyWeb/e-shipper-ruby'

  gem.rubyforge_project = 'e_shipper_ruby'

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'builder'
  gem.add_dependency 'nokogiri'
end
