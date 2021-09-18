# frozen_string_literal: true

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

if Rails.env.production?
  abort('The Rails environment is running in production mode!')
end

require 'rspec/rails'
require 'support/factory_bot'

RSpec.configure do |config|
  config.use_active_record = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

Capybara.register_driver :chrome do |app|
  options = ::Selenium::WebDriver::Chrome::Options.new

  if ENV['JAVASCRIPT_DRIVER'] == 'headless_chrome'
    options.headless!
  end

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.javascript_driver = :chrome
