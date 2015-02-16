require 'sinatra/base'
require 'sinatra'
require 'icecream'
require 'pry'

module RestShifter; end

class Shifter < Sinatra::Base
end

shapes = IceCream::IceCream.new File.join(File.dirname(__FILE__), "../../spec/flavors")

services = []
shapes.all.each do |shape|
  services << shapes.flavor(shape.to_s.gsub!("@", "").to_sym)
end

services.each do |service|

  if service.method_used == "get" 
    get service.path do
      status service.response_status
      content_type service.response_content_type
      service.response_body
    end
  end

  if service.method_used == "post"
    post service.path do
      status service.response_status
      content_type service.response_content_type
      service.response_body
    end

  end
end
