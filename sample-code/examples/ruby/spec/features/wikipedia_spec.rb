require_relative '../../lib/helpers/rails_helper'

feature "Left drawer" do

  scenario "Open left drawer" do
    @home_page = Android::Pages::Home.new()
    @home_page.header.left_drawer_button.click()
    expect(@home_page.left_drawer).to have_today
    puts 'Tests Succeeded!'
  end

end
    # # Click the first button
    # button(1).click
    #
    # # Get the first static text field, then get its text
    # actual_sum = first_text.text
    # raise unless actual_sum == (expected_sum.to_s)
    #
    # # Alerts are visible
    # button('show alert').click
    # find_element :class_name, 'UIAAlert' # Elements can be found by :class_name
    #
    # # wait for alert to show
    # wait { text 'this alert is so cool' }
    #
    # # Or by find
    # find('Cancel').click
    #
    # # Waits until alert doesn't exist
    # wait_true { !exists { tag('UIAAlert') } }
    #
    # # Alerts can be switched into
    # wait { button('show alert').click } # Get a button by its text
    # alert         = driver.switch_to.alert # Get the text of the current alert, using
    # # the Selenium::WebDriver directly
    # alerting_text = alert.text
    # raise Exception unless alerting_text.include? 'Cool title'
    # alert_accept # Accept the current alert
    #
    # # Window Size is easy to get
    # sizes = window_size
    # raise Exception unless sizes.height == 667
    # raise Exception unless sizes.width == 375

    # Quit when you're done!

