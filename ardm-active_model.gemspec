# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dm-active_model/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name             = "ardm-active_model"
  gem.version          = DataMapper::ActiveModel::VERSION

  gem.authors          = [ "Martin Emde", "Martin Gamsjaeger (snusnu)" ]
  gem.email            = [ "me@martinemde.com", "gamsnjaga [a] gmail [d] com" ]
  gem.summary          = "Ardm fork of dm-active_model"
  gem.description      = 'A datamapper plugin for active_model compliance'
  gem.homepage         = "https://github.com/ar-dm/dm-active_model"
  gem.license          = 'MIT'

  gem.files            = `git ls-files`.split("\n")
  gem.test_files       = `git ls-files -- {spec}/*`.split("\n")
  gem.extra_rdoc_files = %w[LICENSE README.md]
  gem.require_paths    = [ "lib" ]

  gem.add_runtime_dependency 'ardm-core',   '~> 1.2'
  gem.add_runtime_dependency 'activemodel', '>= 3.0', '< 5.0'

  gem.add_development_dependency 'ardm-validations', '~> 1.2'
  gem.add_development_dependency 'rake',      '~> 10.0'
  gem.add_development_dependency 'rspec',     '~> 2.0'
  gem.add_development_dependency 'test-unit', '= 1.2.3'
end
