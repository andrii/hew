Feature: Remove generated files

  Use Rails [destroy](http://guides.rubyonrails.org/command_line.html#rails-destroy) (or `d`) command to roll back and delete all the generated files.

  Background:
    Given hew is installed

  Scenario: Remove generated files
    Given I run `rails generate hew purchase`
    When I run `rails destroy hew purchase`
    Then the output should contain:
      """
            remove  spec/fixtures/purchases.yml
            remove  spec/features/user_views_purchases_spec.rb
            remove  spec/features/user_creates_purchase_spec.rb
            remove  spec/features/user_views_purchase_spec.rb
            remove  spec/features/user_updates_purchase_spec.rb
            remove  spec/features/user_deletes_purchase_spec.rb
      """
