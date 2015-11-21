Feature: List generators

  Scenario: List all available generators
    When I run `rails new .`
    And I append to "Gemfile" with "gem 'hew', path: '../..'"
    And I run `bundle install`
    And I run `rails generate`
    Then the output should contain:
      """
      Hew:
        hew:specs
      """
