Feature: Specs help

  @no-clobber
  Scenario: View the hew:specs generator description
    When I run `rails generate hew:specs --help`
    Then the output should contain:
      """
      Usage:
        rails generate hew:specs NAME [field[:type] field[:type]] [options]
      """

