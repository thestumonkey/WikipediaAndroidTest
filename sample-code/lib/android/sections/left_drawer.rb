require_relative "base"

module Android
  module Sections
    class LeftDrawer < Base
      element :today, :xpath, '//android.widget.CheckedTextView[@text="Today"]'
      element :history, :xpath, '//android.widget.CheckedTextView[@text="History"]'
      element :saved_pages, :xpath, 'android.widget.CheckedTextView[@text="Saved Pages"]'
      element :nearby, :xpath, '//android.widget.CheckedTextView[@text="Nearby"]'
      element :random, :xpath, '//android.widget.CheckedTextView[@text="Random"]'
      element :settings, :xpath, '//android.widget.CheckedTextView[@text="Settings"]'
      element :support_links, :xpath, '//android.widget.CheckedTextView[@text="Support Wikipedia"]'
    end
  end
end
