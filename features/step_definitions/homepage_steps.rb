# frozen_string_literal: true

# features/step_definitions/homepage_steps.rb

When('choose travellers as below') do |table|
  @data = table.rows_hash
  @page.homepage.choose_adults(@data.fetch('adults'))
  @page.homepage.choose_children(@data.fetch('children'))
end

And('clicks on select destination') do |table|
  @page.homepage.click_select_destination_button
end
  
# Then('assert travelers to be {int}') do |total|
#   expect(@page.homepage.get_count_of_travellers).to have_content("#{total} travellers")
# end

Then('assert travellers to be {int}') do |total|
  expect(page).to have_content("#{total} travellers")
end
