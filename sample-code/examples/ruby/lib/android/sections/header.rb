module Sections
  class Header < Base
    element :left_drawer_button, :name, "Wikipedia"
    element :search_text, :id, "org.wikipedia:id/main_search_bar_text"
    element :tab_button, :id, "org.wikipedia:id/menu_page_show_tabs"
    element :options_button, :name, "More options"
  end
end
