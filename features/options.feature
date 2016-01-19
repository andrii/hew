Feature: Options

  Pass the `--test-data` (or `-F`) option to preconfigure the tests with [Rails](http://guides.rubyonrails.org/testing.html#the-low-down-on-fixtures) [Fixtures](http://api.rubyonrails.org/classes/ActiveRecord/FixtureSet.html),
  [Factory Girl](https://github.com/thoughtbot/factory_girl_rails) or [Fabrication](http://www.fabricationgem.org/) libraries. Fixtures is the default.

  Background:
    Given hew is installed

  Scenario: Without `-F` option
    When I run `rails generate hew User`
    Then the output should contain:
      """
            create  spec/fixtures/users.yml
      """

  Scenario: `-F` Rails Fixtures
    When I run `rails generate hew User -F fixtures -s`
    Then the output should contain:
      """
            create  spec/fixtures/users.yml
      """

  Scenario: `-F` Factory Girl
    When I run `rails generate hew User -F factory_girl -s`
    Then the output should contain:
      """
            create  spec/factories/users.rb
      """

  Scenario: `-F` Fabrication
    When I run `rails generate hew User -F fabrication -s`
    Then the output should contain:
      """
            create  spec/fabricators/user_fabricator.rb
      """

  Scenario: Unsupported `-F` option
    When I run `rails generate hew User -F=factory_boy`
    Then the output should contain:
      """
      factory_boy library is not supported. Supported options are: fixtures/factory_girl/fabrication.
      """

  Scenario: `--help`
    When I run `rails generate hew --help`
    Then the output should contain:
      """
      Usage:
        rails generate hew NAME [field[:type] field[:type]] [options]

      Options:
            [--skip-namespace], [--no-skip-namespace]  # Skip namespace (affects only isolated applications)
        -F, [--test-data=TEST_DATA]                    # Indicates the test data library (options: fixtures/factory_girl/fabrication)
                                                       # Default: fixtures
      """
