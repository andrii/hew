Feature: Generate specs for a resource with string fields

  Background:
    Given Hew, RSpec Rails and Capybara are installed

  Scenario: Generate specs with string fields
    Given I run `rails generate hew Post title:string slug`
    And a file named "spec/fixtures/posts.yml" should contain exactly:
      """
      post:
        id: 1
        title: Title String
        slug: Slug String
      """
    And a file named "spec/features/user_views_posts_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User views posts' do
        fixtures :posts

        scenario 'posts are present' do
          post = posts(:post)

          visit '/posts'

          expect(page).to have_text(post.title)
          expect(page).to have_text(post.slug)
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

          fill_in 'Title', with: 'Title String'
          fill_in 'Slug', with: 'Slug String'
          click_button 'Create Post'

          expect(page).to have_text 'Post was successfully created.'
        end
      end
      """
    And a file named "spec/features/user_views_post_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User views a post' do
        fixtures :posts

        scenario 'post exists' do
          post = posts(:post)

          visit '/posts'

          click_link 'Show'

          expect(page).to have_text(post.title)
          expect(page).to have_text(post.slug)
        end
      end
      """
    And a file named "spec/features/user_updates_post_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User updates a post' do
        fixtures :posts

        scenario 'post exists' do
          posts(:post)

          visit '/posts'

          click_link 'Edit'

          fill_in 'Title', with: 'Updated Title String'
          fill_in 'Slug', with: 'Updated Slug String'
          click_button 'Update Post'

          expect(page).to have_text 'Post was successfully updated.'
        end
      end
      """
    And a file named "spec/features/user_deletes_post_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User deletes a post' do
        fixtures :posts

        scenario 'post exists' do
          posts(:post)

          visit '/posts'

          click_link 'Destroy'

          expect(page).to have_text 'Post was successfully destroyed.'
        end
      end
      """
    And I run `rails generate scaffold Post title:string slug`
    And I run `rake db:migrate RAILS_ENV=test`
    When I run `bundle exec rspec`
    Then the examples should all pass
