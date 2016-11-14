# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rest_shifter/version"

Gem::Specification.new do |s|
  s.name        = "rest_shifter"
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
  s.default_executable = 'rest_shifter'

  s.require_paths = ["lib"]

  s.add_development_dependency 'simplecov', '~> 0.12.0'
  s.add_development_dependency 'simplecov-json', '~> 0.2'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 1.0.3'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rest-client'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'nyan-cat-formatter'
  s.add_development_dependency 'rack-test'

  s.add_dependency 'icecream', '= 0.0.15'
  s.add_dependency 'sinatra'
  s.add_dependency 'rack-ssl'

end
