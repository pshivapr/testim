# frozen_string_literal: true

class PageInitializer
  def initialize
    @pages = {
      homepage: HomePage.new,
      loginpage: LoginPage.new,
    }
  end

  def method_missing(method_name, *args)
    page = @pages.fetch(method_name, nil)
    return page unless page.nil?

    super
  end

  def respond_to_missing?(method_name, _include_private = false)
    return if @pages.keys.include? method_name

    super
  end
end
