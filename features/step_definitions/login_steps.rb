# frozen_string_literal: true

# features/step_definitions/login_steps.rb

Given(/^User is on homepage$/) do
  visit @base_url
end

When(/^login with below credentials$/) do |table|
  @data = table.rows_hash
  @page.homepage.click_login_menu_button
  @page.loginpage.input_username(@data.fetch('username'))
  @page.loginpage.input_password(@data.fetch('password'))
  @page.loginpage.click_login_button
end

Then(/^validate user logged in to be (.*)$/) do |string|
  expect(page).to have_selector(:xpath, "//span[text()='Hello, John']")
  expect(page).to have_content("HELLO, JOHN")
end

And(/^when logout$/) do
  @page.loginpage.click_user_menu
  @page.loginpage.click_logout_button
end

Then(/^validate user is logged out$/) do
  expect(page).to have_content("SPACE & BEYOND")
end