class RestShifter::Commands::Version
  class << self
    def run(args=ARGV)
      puts "rest_shifter version #{RestShifter::VERSION}"
    end
  end
end
