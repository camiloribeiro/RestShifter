require File.join(File.dirname(__FILE__), './rest_shifter/version')
require 'bundler/setup'

#common dependencies
require 'icecream'
require 'sinatra'

##Modules
require File.join(File.dirname(__FILE__), './rest_shifter/shifter.rb')

##internal dependences

## commands

module RestShifter
end
