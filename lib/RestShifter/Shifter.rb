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

  if service.method_used == "get" 
    if (service.request_accept.length > 0 && service.request_content_type.length > 0)
      get service.path, :provides => service.request_accept, :consumes => service.request_content_type do
        status service.response_status
        content_type service.response_content_type
        service.response_body
      end

    elsif (service.request_accept.length == 0 && service.request_content_type.length > 0)
      get service.path, :consumes => service.request_content_type do
        status service.response_status
        content_type service.response_content_type
        service.response_body
      end

    elsif  (service.request_accept.length > 0 && service.request_content_type.length == 0)
      get service.path, :provides => service.request_accept do
        binding.pry
        status service.response_status
        content_type service.response_content_type
        service.response_body
      end

    elsif
      get service.path do
        status service.response_status
        content_type service.response_content_type
        service.response_body
      end
    end
  end

  if service.method_used == "post"
    if (service.request_accept.length > 0 && service.request_content_type.length > 0)
      post service.path, :provides => service.request_accept, :consumes => service.request_content_type do
        status service.response_status
        content_type service.response_content_type
        service.response_body
      end

    elsif (service.request_accept.length == 0 && service.request_content_type.length > 0)
      post service.path, :consumes => service.request_content_type do
        status service.response_status
        content_type service.response_content_type
        service.response_body
      end

    elsif  (service.request_accept.length > 0 && service.request_content_type.length == 0)
      post service.path, :provides => service.request_accept do
        binding.pry
        status service.response_status
        content_type service.response_content_type
        service.response_body
      end

    elsif
      post service.path do
        status service.response_status
        content_type service.response_content_type
        service.response_body
      end
    end

  end
end
