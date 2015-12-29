Feature: Generate specs for a resource with a text field

  Background:
    Given Hew, RSpec Rails and Capybara are installed

  Scenario: Generate specs with a text field
    Given I run `rails generate hew Message body:text`
    And a file named "spec/fixtures/messages.yml" should contain exactly:
      """
      message:
        id: 1
        body: Body Text
      """
    And a file named "spec/features/user_views_messages_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User views messages' do
        fixtures :messages

        scenario 'messages are present' do
          message = messages(:message)

          visit '/messages'

          expect(page).to have_text(message.body)
        end
      end
      """
    And a file named "spec/features/user_creates_message_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User creates a message' do
        scenario 'with valid parameters' do
          visit '/messages'

          click_link 'New Message'

          fill_in 'Body', with: 'Body Text'
          click_button 'Create Message'

          expect(page).to have_text 'Message was successfully created.'
        end
      end
      """
    And a file named "spec/features/user_views_message_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User views a message' do
        fixtures :messages

        scenario 'message exists' do
          message = messages(:message)

          visit '/messages'

          click_link 'Show'

          expect(page).to have_text(message.body)
        end
      end
      """
    And a file named "spec/features/user_updates_message_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User updates a message' do
        fixtures :messages

        scenario 'message exists' do
          messages(:message)

          visit '/messages'

          click_link 'Edit'

          fill_in 'Body', with: 'Updated Body Text'
          click_button 'Update Message'

          expect(page).to have_text 'Message was successfully updated.'
        end
      end
      """
    And a file named "spec/features/user_deletes_message_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User deletes a message' do
        fixtures :messages

        scenario 'message exists' do
          messages(:message)

          visit '/messages'

          click_link 'Destroy'

          expect(page).to have_text 'Message was successfully destroyed.'
        end
      end
      """
    And I run `rails generate scaffold Message body:text`
    And I run `rake db:migrate RAILS_ENV=test`
    When I run `bundle exec rspec`
    Then the examples should all pass
