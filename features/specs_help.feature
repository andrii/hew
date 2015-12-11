Feature: Specs help

  Background:
    Given Hew is installed

  Scenario: View the hew generator description
    When I run `rails generate hew --help`
    Then the output should contain:
      """
      Usage:
        rails generate hew NAME [field[:type] field[:type]] [options]
      """

