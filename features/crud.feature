Feature: Drive scaffolded CRUD

  Background:
    Given Hew is installed

  @wip
  Scenario: specs fail without a generated scaffold
    Given I run `rails generate hew User email`
    When I run `bundle exec rspec`
    Then the examples should all fail
