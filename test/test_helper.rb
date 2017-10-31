ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

# Set up Minitest
require 'mocha/mini_test'
require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/reporters'

# Added prettier reporters
Minitest::Reporters.use!(
Minitest::Reporters::ProgressReporter.new,
ENV,
Minitest.backtrace_filter)

# VCR
require 'vcr'
VCR.configure do |config|
config.allow_http_connections_when_no_cassette = true
config.cassette_library_dir = 'fixtures/vcr_cassettes'
config.hook_into :webmock
end

# Capybara and poltergeist integration
require 'capybara/rails'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

class ActionDispatch::IntegrationTest
include Capybara::DSL
end

# See: https://gist.github.com/mperham/3049152
class ActiveRecord::Base
mattr_accessor :shared_connection
@@shared_connection = nil

def self.connection
@@shared_connection || ConnectionPool::Wrapper.new(size: 1) { retrieve_connection }
end
end
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
