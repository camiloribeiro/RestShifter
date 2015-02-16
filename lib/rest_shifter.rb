require File.join(File.dirname(__FILE__), './rest_shifter/version')
require 'bundler/setup'

#common dependencies
require 'icecream'
require 'sinatra'

##Modules
require File.join(File.dirname(__FILE__), './rest_shifter/shifter.rb')
require File.join(File.dirname(__FILE__), './rest_shifter/commands.rb')

##internal dependences

## commands
require 'rest_shifter/commands'
require File.join(File.dirname(__FILE__), './rest_shifter/commands/main')
require File.join(File.dirname(__FILE__), './rest_shifter/commands/help')
require File.join(File.dirname(__FILE__), './rest_shifter/commands/version')
require File.join(File.dirname(__FILE__), './rest_shifter/commands/start')

module RestShifter
end
