require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'data_mapper'
require './lib/link'
require './lib/tag'
require './lib/user'

RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec
Cucumber::Rake::Task.new :cuke

task default: [:cop, :spec, :cuke]

task :auto_upgrade do
  DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
  DataMapper.finalize
  DataMapper.auto_upgrade!
  puts 'Auto-upgrade complete (no data loss)'
end

task :auto_migrate do
  DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
  DataMapper.finalize
  DataMapper.auto_migrate!
  puts 'Auto-migrate complete (data could have been lost)'
end
