# frozen_string_literal: true

require 'bundler/setup'
require 'trie/viz'
require 'simplecov'
require 'capybara' 
require 'capybara/rspec'
require 'webdrivers'
require 'trie/application/web'
require 'rack/test' 
require 'helpers/responsive_helpers'
require 'helpers/form_helpers'
module RSpecMixin
  include Rack::Test::Methods
  def app
    Web    
  end
end
ENV['RACK_ENV'] = 'test'

Capybara.app = Web

Webdrivers.install_dir = 'tmp/.webdrivers'
# Chrome
Webdrivers::Chromedriver.required_version = '2.46'
# Firefox
Webdrivers::Geckodriver.required_version  = '0.23.0'
# Internet Explorer
Webdrivers::IEdriver.required_version     = '3.14.0'


Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w(headless disable-gpu no-sandbox disable-dev-shm-usage') }
  )

  Capybara::Selenium::Driver.new app,
    browser: :chrome,
    desired_capabilities: capabilities
end

Capybara.javascript_driver = :headless_chrome

Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver        = ENV["GUI"] ? :selenium : :headless_chrome
end

RSpec.configure do |config|
  config.include RSpecMixin
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers
  config.include ResponsiveHelpers
  config.include FormHelpers

  config.color = true
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = :random
  config.warnings = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
else
  require 'simplecov-console'
  SimpleCov.formatter = SimpleCov::Formatter::Console
end
SimpleCov.start
