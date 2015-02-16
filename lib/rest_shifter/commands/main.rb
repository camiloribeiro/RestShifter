class RestShifter::Commands::Main

  class << self

    def run(args=ARGV)
      cmd = args.shift

      case cmd
      when "-s", "--start", "start"
        RestShifter::Commands::Start.run
        exit 0
      when "-h", "--help", NilClass
        RestShifter::Commands::Help.run
        exit 0
      when "-v", "--version", "version"
        RestShifter::Commands::Version.run
        exit 0
      end

      unless system("restshifter #{cmd}", *args)
        if $?.exitstatus == 127 # bash 'command not found'
          puts "Unknown subcommand #{cmd.inspect}"
          RestShifter::Commands::Help.run
          exit 127
        end
      end
    end
  end
end
