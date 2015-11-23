Feature: List generators

  @no-clobber
  Scenario: List all available generators
    When I run `rails generate`
    Then the output should contain:
      """
      Hew:
        hew:specs
      """
