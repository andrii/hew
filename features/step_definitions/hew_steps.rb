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
