Feature: Drive scaffolded CRUD

  Background:
    Given Hew, RSpec Rails and Capybara are installed

  Scenario: specs fail without a generated scaffold
    Given I run `rails generate hew User email`
    When I run `rspec`
    Then the examples should all fail
