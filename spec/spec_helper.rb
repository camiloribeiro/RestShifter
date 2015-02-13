require 'rspec'
require 'coveralls'
require 'rest_client'
require 'rack/test'

require File.join(File.dirname(__FILE__), '../lib/RestShifter/Shifter.rb')
ENV['RACK_ENV'] = 'test'

Coveralls.wear_merged!

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure do |config|
  config.color = true
  config.formatter     = 'documentation'
  config.include RSpecMixin 
end
