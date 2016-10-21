require_relative 'base'

module Android
  module Pages
    class Home < Base
      element :toc_button, :id, "org.wikipedia:id/floating_toc_button"
    end
  end
end