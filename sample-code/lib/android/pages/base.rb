require "site_prism"
require "capybara"
require 'capybara/rspec'
require_relative '../sections/header'
require_relative '../sections/left_drawer'

module Android
  module Pages
    class Base < SitePrism::Page
      section :header, Android::Sections::Header, :id, "org.wikipedia:id/main_toolbar"
      section :left_drawer, Android::Sections::LeftDrawer , :id, "org.wikipedia:id/design_navigation_view"
    end
  end
end
