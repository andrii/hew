Feature: Drive scaffolded CRUD

  Background:
    Given Hew, RSpec Rails and Capybara are installed

  Scenario: specs fail without a generated scaffold
    Given I run `rails generate hew Post title`
    When I run `bundle exec rspec`
    Then the examples should all fail

  Scenario: specs pass with a generated scaffold
    Given I run `rails generate hew Post title`
    And I run `rails generate scaffold Post title`
    And I run `rake db:migrate RAILS_ENV=test`
    When I run `bundle exec rspec`
    Then the examples should all pass
