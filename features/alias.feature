Feature: Test data library option has an alias

  Background:
    Given Hew, RSpec Rails and Capybara are installed

  Scenario: Specify the test data library using an option alias
    When I run `rails generate hew User -F fixtures -s`
    Then the output should contain:
      """
            create  spec/fixtures/users.yml
      """
    When I run `rails generate hew User -F factory_girl -s`
    Then the output should contain:
      """
            create  spec/factories/users.rb
      """
    When I run `rails generate hew User -F fabrication -s`
    Then the output should contain:
      """
            create  spec/fabricators/user_fabricator.rb
      """
