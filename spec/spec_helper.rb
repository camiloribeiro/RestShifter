require 'rspec'
require 'rest_client'
require 'rack/test'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require File.join(File.dirname(__FILE__), '../lib/rest_shifter/shifter.rb')
ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure do |config|
  config.color = true
  config.include RSpecMixin 
end
