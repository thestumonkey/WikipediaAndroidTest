# rubocop:disable MethodLength
module Helpers
  module SessionHelper
    def register_remote_driver(desired_capabilities, url)
      ENV["PATH"] = [Otter.selenium_config.path, ENV["PATH"]].join ":"

      Capybara.register_driver(:remote) do |app|
        http_client = Selenium::WebDriver::Remote::Http::Persistent.new
        http_client.timeout = 300
        puts "Desired capabilities are: #{desired_capabilities.inspect}"
        driver_options = {
          browser:             :remote,
          url:                  url,
          desired_capabilities: desired_capabilities,
          http_client:          http_client
        }
        Capybara::Selenium::Driver.new app, driver_options
      end

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

      Capybara.register_driver(:poltergeist) do |app|
        driver_options = {
          debug:       ENV["DEBUG"] || false,
          timeout:     300,
          window_size: [1300, 1000],
          js_errors: false,
          phantomjs_options: ["--ssl-protocol=any", "--web-security=no"]
        }
        Capybara::Poltergeist::Driver.new app, driver_options
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

    def quit_driver
      driver.quit if driver.respond_to?(:quit)
    rescue Selenium::WebDriver::Error::WebDriverError => ex
      if ex.message.include?("has already finished") || ex.message.include?("Job is not in progress")
        msg = "Could not quit the driver because it has been more than 90 seconds since last sauce" \
                " command and the session was closed automatically."
        Otter::Loggers.instance.logger.info msg
      else
        raise ex
      end
    end

    def browser
      return nil unless driver.respond_to?(:browser)

      driver.browser
    end

    def session_id
      return nil unless session.touched? && browser.respond_to?(:session_id)
      browser.session_id
    end

    def update_sauce_job_result(passed)
      return if session_id.nil?
      SauceWhisk::Jobs.change_status session_id, passed
    end

    def switch_to_first_window
      browser.switch_to.window(browser.window_handles.first)
    end

    def switch_to_newest_window
      browser.switch_to.window(browser.window_handles.last)
    end

    def dismiss_alert_if_present
      # Sometimes a javascript alert will block us from navigating to about:blank.
      # Accept the alert if it's present to workaround this.

      session.driver.browser.switch_to.alert.accept unless Capybara.default_driver == :poltergeist
    rescue Selenium::WebDriver::Error::NoAlertPresentError
      # There's no alert so we're good
    end
  end
end
