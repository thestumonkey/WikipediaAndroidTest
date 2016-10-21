require "site_prism"
require "capybara"
require 'capybara/rspec'

module Pages
  class Base < SitePrism::Page
    section :header, Sections::Header, :class, "android.widget.FrameLayout"
  end
end
