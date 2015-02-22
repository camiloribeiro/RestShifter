require 'sinatra/base'
require 'icecream'
require 'rack/ssl'

module RestShifter; end

class Shifter < Sinatra::Base

  def self.run_ssl! crt, key
    require 'webrick/https'

    port = 4433 
    certificate_content = File.open(crt).read
    key_content = File.open(key).read

    server_options = {
      :Port => port,
      :SSLEnable => true,
      :SSLCertificate => OpenSSL::X509::Certificate.new(certificate_content),
      :SSLPrivateKey => OpenSSL::PKey::RSA.new(key_content),
      :SSLVerifyClient    => OpenSSL::SSL::VERIFY_NONE
    }

    Rack::Handler::WEBrick.run self, server_options do |server|
      [:INT, :TERM].each { |sig| trap(sig) { server.stop } }
      server.threaded = settings.threaded if server.respond_to? :threaded=
        set :running, true
    end
    set :ssl, true
    set :port, 4433
    run!
  end

  shapes = IceCream::IceCream.new File.dirname("#{Dir.home}/.rest_shifter/flavors/*")
  if ENV["RACK_ENV"] == "test"
    shapes = IceCream::IceCream.new File.join(File.dirname(__FILE__), "../../spec/flavors")
  end

  services = []
  shapes.all.each do |shape|
    services << shapes.flavor(shape.to_s.gsub!("@", "").to_sym)
  end

  gets = services.select { |service| service.method_used == "get"  }
  gets_paths = gets.map { |service| service.path  }.uniq

  posts = services.select { |service| service.method_used == "post"  }
  posts_paths = gets.map { |service| service.path  }.uniq

  gets.each do |service|
    if service.request_accept.to_s == ''
      get service.path do
        sleep service.response_sleep
        status service.response_status
        content_type service.response_content_type
        service.response_body
      end
    else 
      get service.path, :provides => service.request_accept.to_s == '' ? "" : service.request_accept do
        sleep service.response_sleep
        status service.response_status
        content_type service.response_content_type
        service.response_body
      end
    end
  end

  posts.each do |service|
    if service.request_accept.to_s == ''
      post service.path do
        sleep service.response_sleep
        status service.response_status
        content_type service.response_content_type
        service.response_body
      end
    else 
      post service.path, :provides => service.request_accept.to_s == '' ? "" : service.request_accept do
        sleep service.response_sleep
        status service.response_status
        content_type service.response_content_type
        service.response_body
      end
    end
  end


end
