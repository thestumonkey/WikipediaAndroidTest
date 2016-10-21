require_relative '../../lib/helpers/rails_helper'

feature "Left drawer" do

  scenario "Open left drawer" do
    @home_page = Android::Pages::Home.new()
    @home_page.header.left_drawer_button.click()
    expect(@home_page.left_drawer).to have_history
    expect(@home_page.left_drawer).to have_saved_pages
    expect(@home_page.left_drawer).to have_nearby
    expect(@home_page.left_drawer).to have_random
    expect(@home_page.left_drawer).to have_settings
    expect(@home_page.left_drawer).to have_support_links
    puts 'Tests Succeeded!'
  end

end
