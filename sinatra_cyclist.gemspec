# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sinatra/bicyclist/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michael Lavrisha", 'Michal Cichra']
  gem.email         = ["michael.lavrisha@gmail.com", 'michal.cichra@gmail.com']
  gem.description   = %q{Cycle through pages at a regular interval}
  gem.summary       = %q{Sinatra can ride a bicycle over and over and over again}
  gem.homepage      = "https://github.com/mikz/sinatra_bicyclist"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sinatra_bicyclist"
  gem.require_paths = ["lib"]
  gem.version       = Sinatra::Bicyclist::VERSION

  gem.add_dependency "sinatra"

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rack-test'
end
