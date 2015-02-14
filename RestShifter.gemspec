# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "RestShifter/version"

Gem::Specification.new do |s|
  s.name        = "RestShifter"
  s.version     = RestShifter::VERSION
  s.authors     = ["Camilo Ribeiro"]
  s.email       = ["camilo@camiloribeiro.com"]
  s.homepage    = "http://github.com/camiloribeiro/RestShifter"
  s.license     = "Apache 2.0"
  s.summary     = %q{Simple Rest Mock service}
  s.description = %q{RestShifter is a simple rest service that can shift into any kind of service, allowing you to mock rest services with declarative configuration}

  s.rubyforge_project = "RestShifter"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.default_executable = 'RestShifter'

  s.require_paths = ["lib"]

  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rest-client'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'nyan-cat-formatter'
  s.add_development_dependency 'rack-test'

  s.add_dependency 'icecream'
  s.add_dependency 'sinatra'

end
