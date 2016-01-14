Feature: Test data library option has an alias

  Background:
    Given Hew, RSpec Rails and Capybara are installed

  Scenario: Specify the test data library using an option alias
    When I run `rails generate hew User -f=fixtures`
    Then the output should contain:
      """
            create  spec/fixtures/users.yml
      """
    When I run `rails generate hew User -f=factory_girl`
    Then the output should contain:
      """
            create  spec/factories/users.rb
      """
    When I run `rails generate hew User -f=fabrication`
    Then the output should contain:
      """
            create  spec/fabricators/user_fabricator.rb
      """
