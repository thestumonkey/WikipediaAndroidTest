require 'rubygems'
require 'appium_lib'
require "capybara/rspec"
require "appium_capybara"
Dir["../lib/android/pages/*.rb"].each {|file| require file }
require_relative "../lib/android/pages/home"
RSpec.configure do |config|
  config.include Capybara::DSL
end