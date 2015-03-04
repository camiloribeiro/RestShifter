class RestShifter::Commands::Start
  class << self
    def run(port=ARGV)

      prepare_server
      Shifter.set :bind, '0.0.0.0'
      Shifter.set :port, port.to_i
      Shifter.run!
    end

    def run_secure(args=ARGV)
      port = args.shift
      crt = args.shift
      key = args.shift

      prepare_server
      Shifter.use Rack::SSL
      Shifter.set :bind, '0.0.0.0'
      Shifter.run_ssl! port, crt, key
    end

    private
    def prepare_server
      begin
        require 'rest_shifter/shifter.rb'
      rescue LoadError => e
        require 'rubygems'
        path = File.expand_path '../../lib', __FILE__
        $:.unshift(path) if File.directory?(path) && !$:.include?(path)
        require 'rest_shifter/shifter.rb'
      end
    end
  end
end
