# frozen_string_literal: true

require_relative 'base_page'

class HomePage < BasePage
  set_url '/'

  element :login_menu_button, :xpath, "//ul[contains(@class,'TopBar__navigation')]//button"
  element :select_destination_button, :xpath, "//button[contains(@class, 'WQCBB Hero__cta-button')]"
  element :gallery_heading, ".Gallery__headline-2___3amRj"

  expected_elements :login_menu_button

  def click_login_menu_button
    login_menu_button.click
  end

  def select_option_from_dropdown(dropdown, option='default')
    if (dropdown == 'Departing' or dropdown == 'Returning')
      find(:xpath, "//div[@data-react-toolbox='date-picker']//label[text()='#{dropdown}']/../input").click
      find(:xpath, "//button[text()='Ok']").click 
    else
      find(:xpath, "//input[@role='input' and contains(@value, '#{dropdown}')]").click
      find(:xpath, "//li[contains(text(), '#{dropdown}')]/../li[text()='#{option}']").click
    end
  end
  
  def get_count_of_travellers
    gallery_heading.text
  end

  def click_select_destination_button
    select_destination_button.click
  end
end
