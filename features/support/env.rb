# Generated by cucumber-sinatra. (2015-04-18 12:04:46 +0100)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'app/server.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = ChitterScript

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

class ChitterScriptWorld
  include Capybara::DSL
  Capybara.default_driver = ENV['BROWSER_ENV'].to_sym
  Capybara.javascript_driver = :chrome
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  ChitterScriptWorld.new
end