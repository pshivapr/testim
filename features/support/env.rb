# frozen_string_literal: true

require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'faker'
require 'selenium-webdriver'
require 'site_prism'
require 'site_prism/all_there'
require 'time'
require 'webdrivers'

Dir["#{File.dirname(__FILE__)}/../../spec/support/pages/**/*.rb"].each { |file| require file }
FileUtils.remove_dir('results') if File.directory?('results')
FileUtils.mkdir_p('results')

Capybara.save_path = 'results/screenshot'
Capybara.default_driver = :selenium_chrome

TEST_ENV = ENV.fetch('TEST_ENV', 'https://demo.testim.io/prod/?v=2')
# TEST_ENV = ENV.fetch('TEST_ENV', 'https://demo.testim.io/prod')

Before do
  @page = PageInitializer.new
  @base_url = TEST_ENV
end

After do
  Capybara.reset_sessions!
end
