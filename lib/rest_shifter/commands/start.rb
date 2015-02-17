class RestShifter::Commands::Start
  def self.run
    begin
      require 'rest_shifter/shifter.rb'
    rescue LoadError => e
      require 'rubygems'
      path = File.expand_path '../../lib', __FILE__
      $:.unshift(path) if File.directory?(path) && !$:.include?(path)
      require 'rest_shifter/shifter.rb'
    end
   
    Shifter.run!
  end
end
