Feature: Drive scaffolded CRUD

  Background:
    Given Hew, RSpec Rails and Capybara are installed

  Scenario: specs fail without a generated scaffold
    Given I run `rails generate hew Post title`
    When I run `bundle exec rspec`
    Then the examples should all fail
