class RestShifter::Commands::Start
  class << self
    def run(args=ARGV)

      prepare_server
      Shifter.run!
    end

    def run_secure(args=ARGV)
      crt = args.shift
      key = args.shift

      prepare_server
      Shifter.use Rack::SSL
      Shifter.run_ssl! crt, key
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
