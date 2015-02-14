require 'sinatra/base'
require 'sinatra'
require 'icecream'
require 'pry'

module RestShifter; end

class Shifter < Sinatra::Base
end

@shapes = IceCream::IceCream.new File.join(File.dirname(__FILE__), "../../spec/flavors")

@shapes.all.each do |shape|
  service = @shapes.flavor shape.to_s.gsub!("@", "").to_sym
  get service.path do
    status service.status
    service.body
  end
end
