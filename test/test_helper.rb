ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

# Set up Minitest
require 'mocha/mini_test'
require 'minitest/autorun'
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require 'capybara/rails'
require 'capybara/poltergeist'
# require 'minitest/spec'

require 'minitest/reporters'
# require "minitest/spec"

# Added prettier reporters
Minitest::Reporters.use!(
  Minitest::Reporters::ProgressReporter.new,
  ENV,
  Minitest.backtrace_filter
)

# VCR
require 'vcr'
VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
  config.cassette_library_dir = 'fixtures/vcr_cassettes'
  config.hook_into :webmock
end

# Fixtures
class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  fixtures :all
  extend MiniTest::Spec::DSL
end

## Capybara and poltergeist integration
Capybara.javascript_driver = :poltergeist
# Enable Capybara DSL
class ActionDispatch::IntegrationTest
  include Capybara::DSL
end
