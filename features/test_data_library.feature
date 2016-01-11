Feature: Test data library

  Background:
    Given Hew is installed

  Scenario: shows the error message for invalid library name
    When I run `rails generate hew Book --test-data=factory_boy`
    Then the output should contain:
      """
      factory_boy library is not supported. Supported options are: fixtures/factory_girl/fabrication.
      """
