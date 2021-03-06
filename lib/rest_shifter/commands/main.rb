class RestShifter::Commands::Main

  class << self

    def run(args=ARGV)
      cmd = args.shift

      case cmd
      when "-s", "--start", "start"
        port = args.shift 
        port = "8080" unless !port.to_s.empty?
        RestShifter::Commands::Start.run port
        exit 0
      when "-X", "--start-secure-no-cert", "start-secure-no-cert"
        port = args.shift 
        port = "4443" unless !port.to_s.empty?
        RestShifter::Commands::Start.run_secure_no_cert port
        exit 0
      when "-S", "--start-secure", "start-secure"
        port = args.shift 
        cert = args.shift 
        key = args.shift 
        port = "4443" unless !port.to_s.empty?
        RestShifter::Commands::Start.run_secure port, cert, key
        exit 0
      when "-c", "--create", "create"
        RestShifter::Commands::Create.run
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
