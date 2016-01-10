Given(/^Hew is installed$/) do
  steps %Q{
    Given I run `gem install rails --no-ri --no-rdoc`
    Given I run `rails new . --skip-spring --skip-sprockets`
    Given I append to "Gemfile" with "gem 'hew', path: '../..'"
    Given I run `bundle install`
  }
end

Given(/^Hew, RSpec Rails and Capybara are installed$/) do
  steps %Q{
    Given Hew is installed
    Given I append to "Gemfile" with:
      """

      gem 'rspec-rails'
      gem 'capybara'
      """
    Given I run `bundle install`
    Given I run `rails generate rspec:install`
  }
end

Given(/^Hew, RSpec Rails, Capybara and Factory Girl are installed$/) do
  steps %Q{
    Given Hew, RSpec Rails and Capybara are installed
    Given I append to "Gemfile" with:
      """

      gem 'factory_girl_rails'
      """
    Given I run `bundle install`
    Given I write to "spec/support/factory_girl.rb" with:
      """
      RSpec.configure do |config|
        config.include FactoryGirl::Syntax::Methods
      end
      """
    Given I append to "spec/rails_helper.rb" with:
      """
      Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
      """
  }
end
