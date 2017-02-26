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

  s.add_development_dependency 'simplecov', '= 0.12.0'
  s.add_development_dependency 'simplecov-json', '= 0.2'
  s.add_development_dependency 'codeclimate-test-reporter', '= 1.0.6'
  s.add_development_dependency 'pry', '= 0.10.4'
  s.add_development_dependency 'cucumber', '= 2.4.0'
  s.add_development_dependency 'rake', '= 12.0.0'
  s.add_development_dependency 'rest-client', '= 1.8.0'
  s.add_development_dependency 'rspec', '= 3.5.0'
  s.add_development_dependency 'nyan-cat-formatter', '= 0.11'
  s.add_development_dependency 'rack-test', '= 0.6.3'

  s.add_dependency 'icecream', '= 0.0.16'
  s.add_dependency 'sinatra', '= 1.4.8'
  s.add_dependency 'rack-ssl', '= 1.4.1'

end
