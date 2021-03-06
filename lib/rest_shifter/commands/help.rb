class RestShifter::Commands::Help

  def self.run
    puts <<-HELP
Usage: rest_shifter <command> [options*]

rest_shifter version #{RestShifter::VERSION}: The ShapeShifter Rest Service

  Available commands:

    --help                  Show this help text
    
    --start, -s:          Start service on port 4567
    --start-secure, -S:   Start https service on port 4433 (crt, key)

    --create, -c:         Create a config file for a service (send a name as argument)
      
    --version, -v:        Print version and exit
    --help, -h:           Show this message

    For more support read our api >> http://rubydoc.info/gems/rest_shifter
    Have a nice day :)
    HELP
  end
end
