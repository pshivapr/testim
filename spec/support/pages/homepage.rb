# frozen_string_literal: true

require_relative 'base_page'

class HomePage < BasePage
  set_url '/'

  element :login_menu_button, :xpath, "//ul[contains(@class,'TopBar__navigation')]//button"
  element :adults_dropdown, :xpath, "//input[@role='input' and contains(@value, 'Adults')]"
  element :children_dropdown, :xpath, "//input[@role='input' and contains(@value, 'Children')]"
  element :select_destination_button, :xpath, "//button[contains(text(), 'Select Destination')]"
  element :gallery_heading, ".Gallery__headline-2___3amRj"

  expected_elements :login_menu_button

  def click_login_menu_button
    login_menu_button.click
  end

  def choose_adults(number)
    adults_dropdown.click
    find(:xpath, "//li[contains(text(), 'Adults')]/../li[text()='#{number}']").click
    
  end

  def choose_children(number)
    children_dropdown.click
    find(:xpath, "//li[contains(text(), 'Children')]/../li[text()='#{number}']").click
  end
  
  def get_count_of_travellers
    gallery_heading.text
  end

  def click_select_destination_button
    select_destination_button.click
  end
end
