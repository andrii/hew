require 'aruba/cucumber'

Before do
  delete_environment_variable 'BUNDLE_GEMFILE'
  delete_environment_variable 'RUBYOPT'
end

Aruba.configure do |config|
  config.exit_timeout = 120
end
