Feature: Edge cases

  The fields with unsupported types are treated as string fields.

  Background:
    Given hew, rspec-rails and capybara are installed

  Scenario: Resource field has an unsupported type
    When I run `rails generate hew Book pdf:binary`
    Then a file named "spec/fixtures/books.yml" should contain exactly:
      """
      book:
        id: 1
        pdf: MyString
      """
    And a file named "spec/features/user_views_books_spec.rb" should contain exactly:
      """ruby
      require 'rails_helper'

      RSpec.feature 'User views books' do
        fixtures :books

        scenario 'books are present' do
          book = books(:book)

          visit '/books'

          expect(page).to have_text(book.pdf)
        end
      end
      """
    And a file named "spec/features/user_creates_book_spec.rb" should contain exactly:
      """ruby
      require 'rails_helper'

      RSpec.feature 'User creates a book' do
        scenario 'with valid parameters' do
          visit '/books'

          click_link 'New Book'

          fill_in 'Pdf', with: 'MyString'
          click_button 'Create Book'

          expect(page).to have_text 'Book was successfully created.'
        end
      end
      """
    And a file named "spec/features/user_views_book_spec.rb" should contain exactly:
      """ruby
      require 'rails_helper'

      RSpec.feature 'User views a book' do
        fixtures :books

        scenario 'book exists' do
          book = books(:book)

          visit '/books'

          click_link 'Show'

          expect(page).to have_text(book.pdf)
        end
      end
      """
    And a file named "spec/features/user_updates_book_spec.rb" should contain exactly:
      """ruby
      require 'rails_helper'

      RSpec.feature 'User updates a book' do
        fixtures :books

        scenario 'book exists' do
          books(:book)

          visit '/books'

          click_link 'Edit'

          fill_in 'Pdf', with: 'Updated MyString'
          click_button 'Update Book'

          expect(page).to have_text 'Book was successfully updated.'
        end
      end
      """
    And a file named "spec/features/user_deletes_book_spec.rb" should contain exactly:
      """ruby
      require 'rails_helper'

      RSpec.feature 'User deletes a book' do
        fixtures :books

        scenario 'book exists' do
          books(:book)

          visit '/books'

          click_link 'Destroy'

          expect(page).to have_text 'Book was successfully destroyed.'
        end
      end
      """
    And I run `rails generate scaffold Book pdf:binary`
    And I run `rake db:migrate RAILS_ENV=test`
    When I run `bundle exec rspec spec/features`
    Then the examples should all pass

  Scenario: Resource has no fields
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
      """ruby
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
      """ruby
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
      """ruby
      require 'rails_helper'

      RSpec.feature 'User views a post' do
        fixtures :posts

        scenario 'post exists' do
          post = posts(:post)

          visit '/posts'

          click_link 'Show'

        end
      end
      """
    And a file named "spec/features/user_updates_post_spec.rb" should contain exactly:
      """ruby
      require 'rails_helper'

      RSpec.feature 'User updates a post' do
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
      """ruby
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
