@no-clobber
Feature: List generators

  Scenario: List all available generators
    When I run `rails generate`
    Then the output should contain:
      """
      Hew:
        hew:specs
      """
