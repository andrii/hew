Feature: Specs help

  Scenario: View the hew:specs generator description
    When I run `rails new . --skip-spring`
    And I append to "Gemfile" with "gem 'hew', path: '../..'"
    And I run `bundle install`
    And I run `rails generate hew:specs --help`
    Then the output should contain:
      """
      Usage:
        rails generate hew:specs NAME [field[:type] field[:type]] [options]
      """

