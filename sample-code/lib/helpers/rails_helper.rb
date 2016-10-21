require 'rubygems'
require 'appium_lib'
require "capybara/rspec"
require "appium_capybara"
Dir["../android/pages/*.rb"].each {|file| require file }
require_relative "../android/pages/home"
require_relative "session_helper"


module Helpers
  module RailsHelper

    def register_remote_driver(desired_capabilities, url)
      ENV["PATH"] = [Otter.selenium_config.path, ENV["PATH"]].join ":"



      Capybara.default_max_wait_time = 10
      Capybara.ignore_hidden_elements = true
    end

    RSpec.configure do |config|
      config.include Capybara::DSL
    end

    url = "http://localhost:4723/wd/hub" # or a sauce labs url

    @desired_caps_android = {
        platformName:    ENV["SELENIUM_PLATFORM_NAME"] || "Android",
        deviceName:      ENV["SELENIUM_DEVICE"] || "Samsung Galaxy S4 GoogleAPI Emulator",
        platformVersion: ENV["SELENIUM_VERSION"] || "5.0",
        deviceOrientation: ENV["SELENIUM_DEVICE_ORIENTATION"] || "portrait",
        appActivity:     ENV["APPIUM_APP_ACTIVITY"] || 'org.wikipedia.page.PageActivity',
        # app:             '../../../apps/Wikipedia.apk',
        appPackage:      'org.wikipedia',
        setWebContentsDebuggingEnabled: true
    }

    Capybara.register_driver(:appium) do |app|

      puts "Desired capabilities are: #{@desired_caps_android.inspect}"
      puts url
      appium_lib_options = {
          server_url:           url,
          # http_client:          http_client
      }
      all_options = {
          appium_lib:  appium_lib_options,
          caps:        @desired_caps_android
      }
      driver = Appium::Capybara::Driver.new app, all_options

    end
    Capybara.default_driver = :appium

    # Appium::Driver.new(@desired_caps_android).start_driver



  end
end
