require 'rspec/core/rake_task'
require 'coveralls/rake/task'

Coveralls::RakeTask.new

task :default => [:spec]
# task :default => [:spec, 'coveralls:push']

RSpec::Core::RakeTask .new(:spec) do |task|
    task.rspec_opts = ["--format documentation"]
end

RSpec::Core::RakeTask .new(:nyan) do |task|
    task.rspec_opts = ["--format NyanCatFormater"]
end
