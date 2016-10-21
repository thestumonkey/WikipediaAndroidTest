module Helpers
  module SessionHelper
    def register_remote_driver(desired_capabilities, url)
      ENV["PATH"] = [Otter.selenium_config.path, ENV["PATH"]].join ":"

      Capybara.register_driver(:appium) do |app|
        # How do we configure the http client?
        # http_client = Selenium::WebDriver::Remote::Http::Persistent.new
        # http_client.timeout = 300
        puts "Desired capabilities are: #{desired_capabilities.inspect}"
        puts url
        appium_lib_options = {
          server_url:           url,
          # http_client:          http_client
        }
        all_options = {
          appium_lib:  appium_lib_options,
          caps:        desired_capabilities
        }
        Appium::Capybara::Driver.new app, all_options
      end

      Capybara.default_max_wait_time = 10
      Capybara.ignore_hidden_elements = true
    end

    def configure_site_prism
      SitePrism.configure do |config|
        config.use_implicit_waits = true
      end
    end

    def session
      Capybara.current_session
    end

    def driver
      return nil unless session.respond_to?(:driver)
      session.driver
    end
  end
end
