begin
  require 'database_cleaner'
  require 'database_cleaner/cucumber'
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean
end

Around do |_scenario, block|
  DatabaseCleaner.cleaning(&block)
end