require 'fileutils'

class RestShifter::Commands::Create
  class << self
    def run(args=ARGV)
      name = args.shift + ".flavor"
      dirname = File.dirname("#{Dir.home}/.rest_shifter/flavors/foo")
      FileUtils.mkdir_p(dirname) unless File.exists?(dirname)
      File.open(dirname + "/" + name, 'w') {|f| f.write(
'method_used                 = "get"
path                        = "/hello_world"
response_sleep              = 0
response_status             = "200"
response_body               = "{ \"hello_world\" : \"Your service is working fine. :D\" }"
response_content_type       = "application/json"') }
    end
  end
end
