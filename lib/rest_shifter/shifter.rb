require 'sinatra/base'
require 'icecream'
require 'rack/ssl'
require 'webrick/https'

module RestShifter; end

class Shifter < Sinatra::Base

  def self.run_ssl! port, crt, key
    server_options = {
      :Port => port.to_i,
      :bind => '0.0.0.0',
      :SSLEnable => true,
      :SSLCertificate => OpenSSL::X509::Certificate.new(File.open(crt).read),
      :SSLPrivateKey => OpenSSL::PKey::RSA.new(File.open(key).read),
      :SSLVerifyClient    => OpenSSL::SSL::VERIFY_NONE
    }

    Rack::Handler::WEBrick.run self, server_options do |server|
      [:INT, :TERM].each { |sig| trap(sig) { server.stop } }
      server.threaded = settings.threaded if server.respond_to? :threaded=
        set :running, true
    end
  end

  shapes = IceCream::IceCream.new File.dirname("#{Dir.home}/.rest_shifter/flavors/*")
  if ENV["RACK_ENV"] == "test"
    shapes = IceCream::IceCream.new File.join(File.dirname(__FILE__), "../../spec/flavors")
  end

  @services = []
  shapes.all.each do |shape|
    @services << shapes.flavor(shape.to_s.gsub!("@", "").to_sym)
  end

  def self.build_services
    @services.each do |service|
      if service.request_accept.to_s == ''
        send(service.method_used.to_sym, service.path) do
          yield self, service
        end
      else 
        send(service.method_used.to_sym, service.path, :provides => service.request_accept.to_s) do
          yield self, service
        end
      end
    end
  end
  
  build_services { 
    |current, service| 
    current.response['Location'] = service.response_location unless service.response_location.to_s.empty?
    sleep service.response_sleep
    current.status service.response_status
    current.content_type service.response_content_type
    service.response_body
  }
end
