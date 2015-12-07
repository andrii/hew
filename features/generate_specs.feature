@no-clobber
Feature: Generate specs

  Scenario: Generate specs with no fields
    When I run `rails generate hew:specs post`
    Then the output should contain:
      """
            create  spec/features/user_views_posts_spec.rb
            create  spec/features/user_creates_post_spec.rb
            create  spec/features/user_views_post_spec.rb
            create  spec/features/user_updates_post_spec.rb
            create  spec/features/user_deletes_post_spec.rb
      """
    And a file named "spec/features/user_views_posts_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User views posts' do
        scenario 'posts are present' do
          visit '/posts'
        end
      end
      """
    And a file named "spec/features/user_creates_post_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User creates a post' do
        scenario 'with valid parameters' do
          visit '/posts'

          click_link 'New Post'

          click_button 'Create Post'

          expect(page).to have_text 'Post was successfully created.'
        end
      end
      """
    And a file named "spec/features/user_views_post_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User views a post' do
        scenario 'post exists' do
          visit '/posts'

          click_link 'Show'
        end
      end
      """
    And a file named "spec/features/user_updates_post_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      Rspec.feature 'User updates a post' do
        scenario 'post exists' do
          visit '/posts'

          click_link 'Edit'

          click_button 'Update Post'

          expect(page).to have_text 'Post was successfully updated.'
        end
      end
      """
    And a file named "spec/features/user_deletes_post_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      Rspec.feature 'User deletes a post' do
        scenario 'post exists' do
          visit '/posts'

          click_link 'Destroy'

          expect(page).to have_text 'Post was successfully destroyed.'
        end
      end
      """
