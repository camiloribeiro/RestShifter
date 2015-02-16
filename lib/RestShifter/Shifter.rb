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

gets = services.select { |service| service.method_used == "get"  }
gets_paths = gets.map { |service| service.path  }.uniq

posts = services.select { |service| service.method_used == "post"  }
posts_paths = gets.map { |service| service.path  }.uniq

gets.each do |service|
  get service.path do
    status service.response_status
    content_type service.response_content_type
    service.response_body
  end
end

posts.each do |service|
  post service.path do
    status service.response_status
    content_type service.response_content_type
    service.response_body
  end
end
