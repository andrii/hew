@no-clobber
Feature: Delete specs

  Scenario: Delete generated specs
    Given I run `rails generate hew:specs purchase`
    When I run `rails destroy hew:specs purchase`
    Then the output should contain:
      """
            remove  spec/features/user_views_purchases_spec.rb
            remove  spec/features/user_creates_purchase_spec.rb
            remove  spec/features/user_views_purchase_spec.rb
            remove  spec/features/user_updates_purchase_spec.rb
            remove  spec/features/user_deletes_purchase_spec.rb
      """
