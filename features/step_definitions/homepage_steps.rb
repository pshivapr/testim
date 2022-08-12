# frozen_string_literal: true

# features/step_definitions/homepage_steps.rb

When('choose travellers as below') do |table|
  @data = table.rows_hash
  @page.homepage.select_option_from_dropdown('Adults', @data.fetch('adults'))
  @page.homepage.select_option_from_dropdown('Children', @data.fetch('children'))
end

When('clicks select destination with default values') do
  @page.homepage.select_option_from_dropdown('Departing')
  @page.homepage.select_option_from_dropdown('Returning')
  @page.homepage.click_select_destination_button
end

And('clicks on select destination') do |table|
  @page.homepage.click_select_destination_button
end
  
Then('assert travellers to be {int}') do |total|
  expect(@page.homepage.get_count_of_travellers).to have_content("#{total} travellers")
end

And('book planet by name {string}') do |planet|
  @page.nextdestinationpage.book_destination(planet)
end

Then('assert page with valid dates') do
  date_current = (Date.today + 1).strftime('%b ' '%d').to_s
  date_end = (Date.today + 7).strftime('%d').to_s
  expect(page).to have_content("#{date_current} – #{date_end}")
end
