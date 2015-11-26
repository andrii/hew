@no-clobber
Feature: Generate specs

  Scenario: Generate specs with no arguments
    When I run `rails generate hew:specs post`
    Then the output should contain:
      """
            create  spec/features/user_views_posts_spec.rb
            create  spec/features/user_creates_post_spec.rb
            create  spec/features/user_views_post_spec.rb
            create  spec/features/user_updates_post_spec.rb
            create  spec/features/user_deletes_post_spec.rb
      """
