# frozen_string_literal: true

require_relative 'base_page'

class YourNextDestinationPage < BasePage

  def book_destination(title)
    find(:xpath, "//div[@data-react-toolbox='card']//*[text()='#{title}']//../../..//button").click
  end
end