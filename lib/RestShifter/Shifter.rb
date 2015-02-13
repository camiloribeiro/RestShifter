require 'sinatra/base'
require 'sinatra'

module RestShifter; end

class Shifter < Sinatra::Base; end

get '/hi' do
  "Hello World!"
end
