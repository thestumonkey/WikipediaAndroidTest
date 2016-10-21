require_relative "base"

module Android
  module Sections
    class Header < Base
      element :left_drawer_button, :class, "android.widget.ImageButton"
      element :search_text, :id, "org.wikipedia:id/main_search_bar_text"
      element :tab_button, :id, "org.wikipedia:id/menu_page_show_tabs"
      element :options_button, :class, "android.widget.ImageView"
    end
  end
end
