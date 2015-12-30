Feature: Generate specs

  Background:
    Given Hew, RSpec Rails and Capybara are installed

  Scenario: Generate specs with no fields
    When I run `rails generate hew post`
    Then the output should contain:
      """
            create  spec/fixtures/posts.yml
            create  spec/features/user_views_posts_spec.rb
            create  spec/features/user_creates_post_spec.rb
            create  spec/features/user_views_post_spec.rb
            create  spec/features/user_updates_post_spec.rb
            create  spec/features/user_deletes_post_spec.rb
      """
    And a file named "spec/fixtures/posts.yml" should contain exactly:
      """
      post:
        id: 1
      """
    And a file named "spec/features/user_views_posts_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User views posts' do
        fixtures :posts

        scenario 'posts are present' do
          post = posts(:post)

          visit '/posts'

        end
      end
      """
    And a file named "spec/features/user_creates_post_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User creates post' do
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

      RSpec.feature 'User views post' do
        fixtures :posts

        scenario 'post exists' do
          post = posts(:post)

          visit '/posts'

          click_link 'Show'

        end
      end
      """
    And a file named "spec/features/user_updates_post_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User updates post' do
        fixtures :posts

        scenario 'post exists' do
          posts(:post)

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

      RSpec.feature 'User deletes post' do
        fixtures :posts

        scenario 'post exists' do
          posts(:post)

          visit '/posts'

          click_link 'Destroy'

          expect(page).to have_text 'Post was successfully destroyed.'
        end
      end
      """

  Scenario: Generate specs with fields
    Given I run `rails generate hew Apartment full_address:string description:text bedrooms:integer`
    And a file named "spec/fixtures/apartments.yml" should contain exactly:
      """
      apartment:
        id: 1
        full_address: MyString
        description: MyText
        bedrooms: 1
      """
    And a file named "spec/features/user_views_apartments_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User views apartments' do
        fixtures :apartments

        scenario 'apartments are present' do
          apartment = apartments(:apartment)

          visit '/apartments'

          expect(page).to have_text(apartment.full_address)
          expect(page).to have_text(apartment.description)
          expect(page).to have_text(apartment.bedrooms)
        end
      end
      """
    And a file named "spec/features/user_creates_apartment_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User creates apartment' do
        scenario 'with valid parameters' do
          visit '/apartments'

          click_link 'New Apartment'

          fill_in 'Full address', with: 'MyString'
          fill_in 'Description', with: 'MyText'
          fill_in 'Bedrooms', with: '1'
          click_button 'Create Apartment'

          expect(page).to have_text 'Apartment was successfully created.'
        end
      end
      """
    And a file named "spec/features/user_views_apartment_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User views apartment' do
        fixtures :apartments

        scenario 'apartment exists' do
          apartment = apartments(:apartment)

          visit '/apartments'

          click_link 'Show'

          expect(page).to have_text(apartment.full_address)
          expect(page).to have_text(apartment.description)
          expect(page).to have_text(apartment.bedrooms)
        end
      end
      """
    And a file named "spec/features/user_updates_apartment_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User updates apartment' do
        fixtures :apartments

        scenario 'apartment exists' do
          apartments(:apartment)

          visit '/apartments'

          click_link 'Edit'

          fill_in 'Full address', with: 'Updated MyString'
          fill_in 'Description', with: 'Updated MyText'
          fill_in 'Bedrooms', with: '2'
          click_button 'Update Apartment'

          expect(page).to have_text 'Apartment was successfully updated.'
        end
      end
      """
    And a file named "spec/features/user_deletes_apartment_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User deletes apartment' do
        fixtures :apartments

        scenario 'apartment exists' do
          apartments(:apartment)

          visit '/apartments'

          click_link 'Destroy'

          expect(page).to have_text 'Apartment was successfully destroyed.'
        end
      end
      """
    And I run `rails generate scaffold Apartment full_address:string description:text bedrooms:integer`
    And I run `rake db:migrate RAILS_ENV=test`
    When I run `bundle exec rspec`
    Then the examples should all pass
