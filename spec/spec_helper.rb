# Set the environment to test

ENV['ENVIRONMENT'] = 'test'


# Requiring all of the testing gems

require "capybara"
require "capybara/rspec"
require "rspec"
require "simplecov"
require "simplecov-console"

# Get test coverage

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])

SimpleCov.start

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
