# frozen_string_literal: true

# features/step_definitions/base_steps.rb

And(/^page should contain following data:$/) do |table|
    @list = table.raw
    @list.each do |data|
      data.each do |assert_string|
        expect(self).to have_content(assert_string)
      end
    end
  end
  
  And(/^has the following test data:$/) do |table|
    @data = table.rows_hash
  end
  
  And(/^assert element count$/) do |elements|
    assert_element_count(elements)
  end
  
  And(/^when clicks on (.*) link then assert url (.*) and page title to be (.*)$/) do |link, url, title|
    click_on(link)
    expect(page).to have_current_path(url)
    expect(self).to have_title(title)
  end
  
  And(/^switch to tab (-?\d+)$/) do |tab|
    page.switch_to_window(windows[tab - 1])
  end
  
  When(/^open and switch to new window$/) do
    new_window = open_new_window
    switch_to_window new_window
  end
  
  # Asserting element count for each selector listed
  def assert_element_count(elements = {}, visible: false)
    elements.each do |selector_type, count|
      expect(self).to have_selector(selector_type.to_s, count: count, visible: visible)
    end
  end
  