Feature: List generators

  Background:
    Given Hew is installed

  Scenario: List all available generators
    When I run `rails generate`
    Then the output should contain:
      """
      Hew:
        hew
      """
