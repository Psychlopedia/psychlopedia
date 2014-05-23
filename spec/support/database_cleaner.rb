require 'database_cleaner'

RSpec.configure do |configuration|
  # Get rid of evil leftovers and wipes the test database entirely.
  configuration.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  # And... what about acceptance tests? We should use the truncation strategy.

  # Hooking up DatabaseCleaner to the beginning and end of each test so it executes whatever cleanup strategy was selected.
  configuration.before(:each) do
    DatabaseCleaner.start
  end

  # ...
  configuration.after(:each) do
    DatabaseCleaner.clean
  end
end
