Given(/^hew is installed$/) do
  steps %Q{
    Given I run `gem install rails --no-ri --no-rdoc`
      And I run `rails new . --skip-spring --skip-sprockets`
      And I append to "Gemfile" with "gem 'hew', path: '../..'"
      And I run `bundle install`
  }
end

Given(/^hew, rspec-rails and capybara are installed$/) do
  steps %Q{
    Given hew is installed
      And I append to "Gemfile" with:
        """

        gem 'rspec-rails'
        gem 'capybara'
        """
      And I run `bundle install`
      And I run `rails generate rspec:install`
  }
end

Given(/^hew, rspec-rails, capybara and factory_girl_rails are installed$/) do
  steps %Q{
    Given hew, rspec-rails and capybara are installed
      And I append to "Gemfile" with:
        """

        gem 'factory_girl_rails'
        """
      And I run `bundle install`
      And I write to "spec/support/factory_girl.rb" with:
        """
        RSpec.configure do |config|
          config.include FactoryGirl::Syntax::Methods
        end
        """
      And I append to "spec/rails_helper.rb" with:
        """
        Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
        """
  }
end

Given(/^hew, rspec-rails, capybara and fabrication are installed$/) do
  steps %Q{
    Given hew, rspec-rails and capybara are installed
      And I append to "Gemfile" with:
        """

        gem 'fabrication'
        """
      And I run `bundle install`
  }
end
