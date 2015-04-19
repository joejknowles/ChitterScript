require 'rubocop/rake_task'
require 'rspec/core/rake_task'
require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'capybara'
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end
RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec

require 'jasmine'
load 'jasmine/tasks/jasmine.rake'

if ENV['TEST'] == 'travis'
  task default: [:migrate, :set_chrome, :cop, :features]
end

task default: [:set_chrome, :cop, :features]

task :set_chrome do
  ENV["BROWSER_ENV"] = 'chrome'
end

task :set_fire do
  ENV["BROWSER_ENV"] = 'selenium'
end

task fire: [:set_fire, :cop, :features]

task :upgrade do
  require './app/data_mapper_setup'
  DataMapper.auto_upgrade!
  puts "DB upgraded"
end

task :migrate do
  require './app/data_mapper_setup'
  DataMapper.auto_migrate!
  puts "DB upgraded, data may be lost"
end

task :migrate_test do
  ENV['RACK_ENV'] = 'test'
  require './app/data_mapper_setup'
  DataMapper.auto_migrate!
  puts "test DB upgraded, data may be lost"
end

if ENV['TEST'] == 'travis'
  task default: [:migrate, :set_chrome, :cop, :features]
end