# frozen_string_literal: true

require_relative 'base_page'

class LoginPage < BasePage
  set_url '/'

  element :username_input, :xpath, "//span[text()='Username']//../input"
  element :password_input, :xpath, "//span[text()='Password']//../input"
  element :login_button, :xpath, "//button[@form='login']"

  element :user_menu, :xpath, "//span[text()='Hello, John']"
  element :logout_button, :xpath, "//a[text()='Log out']"

  expected_elements :username_input, :password_input, :login_button

  def input_username(username)
    username_input.set(username)
  end

  def input_password(password)
    password_input.set(password)
  end

  def click_login_button
    login_button.click
  end

  def click_logout_button
    logout_button.click
  end

  def click_user_menu
    user_menu.click
  end
end