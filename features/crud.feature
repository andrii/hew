Feature: CRUD

  Generated RSpec feature specs cover the standard Rails CRUD functionality.
  Same fields can be used with Rails scaffold generator to make the specs pass.

  Background:
    Given hew, rspec-rails and capybara are installed

  Scenario: specs fail without a CRUD implementation
    When I run `rails generate hew Post title`
    Then the output should contain:
      """
            create  spec/fixtures/posts.yml
            create  spec/features/user_views_posts_spec.rb
            create  spec/features/user_creates_post_spec.rb
            create  spec/features/user_views_post_spec.rb
            create  spec/features/user_updates_post_spec.rb
            create  spec/features/user_deletes_post_spec.rb
      """
    When I run `bundle exec rspec spec/features`
    Then the examples should all fail

  Scenario: specs pass with CRUD implementation
    Given I run `rails generate hew Post title`
      And I run `rails generate scaffold Post title`
      And I run `rake db:migrate RAILS_ENV=test`
    When I run `bundle exec rspec`
    Then the examples should all pass
