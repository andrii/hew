Feature: Generate specs for a resource with an integer field

  Background:
    Given Hew, RSpec Rails and Capybara are installed

  Scenario: Generate specs with an integer field
    Given I run `rails generate hew Invoice quantity:integer`
    And a file named "spec/fixtures/invoices.yml" should contain exactly:
      """
      invoice:
        id: 1
        quantity: 1
      """
    And a file named "spec/features/user_views_invoices_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User views invoices' do
        fixtures :invoices

        scenario 'invoices are present' do
          invoice = invoices(:invoice)

          visit '/invoices'

          expect(page).to have_text(invoice.quantity)
        end
      end
      """
    And a file named "spec/features/user_creates_invoice_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User creates a invoice' do
        scenario 'with valid parameters' do
          visit '/invoices'

          click_link 'New Invoice'

          fill_in 'Quantity', with: 1
          click_button 'Create Invoice'

          expect(page).to have_text 'Invoice was successfully created.'
        end
      end
      """
    And a file named "spec/features/user_views_invoice_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User views a invoice' do
        fixtures :invoices

        scenario 'invoice exists' do
          invoice = invoices(:invoice)

          visit '/invoices'

          click_link 'Show'

          expect(page).to have_text(invoice.quantity)
        end
      end
      """
    And a file named "spec/features/user_updates_invoice_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User updates a invoice' do
        fixtures :invoices

        scenario 'invoice exists' do
          invoices(:invoice)

          visit '/invoices'

          click_link 'Edit'

          fill_in 'Quantity', with: 2
          click_button 'Update Invoice'

          expect(page).to have_text 'Invoice was successfully updated.'
        end
      end
      """
    And a file named "spec/features/user_deletes_invoice_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User deletes a invoice' do
        fixtures :invoices

        scenario 'invoice exists' do
          invoices(:invoice)

          visit '/invoices'

          click_link 'Destroy'

          expect(page).to have_text 'Invoice was successfully destroyed.'
        end
      end
      """
    And I run `rails generate scaffold Invoice quantity:integer`
    And I run `rake db:migrate RAILS_ENV=test`
    When I run `bundle exec rspec`
    Then the examples should all pass
