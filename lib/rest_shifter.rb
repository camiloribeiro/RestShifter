require File.join(File.dirname(__FILE__), './RestShifter/version')
require 'bundler/setup'

#common dependencies
require 'icecream'
require 'sinatra'

##Modules
require File.join(File.dirname(__FILE__), './RestShifter/Shifter.rb')

##internal dependences

## commands

module RestShifter
end
