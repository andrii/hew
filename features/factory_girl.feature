Feature: Generate specs with Factory Girl

  Background:
    Given Hew, RSpec Rails, Capybara and Factory Girl are installed

  Scenario: Generate specs with Factory Girl
    When I run `rails generate hew Apartment full_address:string description:text bedrooms:integer latitude:float longitude:float price:decimal sprinkler_check_at:datetime check_in_at:time available_from:date fireplace:boolean --test-data=factory_girl`
    Then a file named "spec/factories/apartments.rb" should contain exactly:
      """
      FactoryGirl.define do
        factory :apartment do
          full_address 'MyString'
          description 'MyText'
          bedrooms 1
          latitude 1.5
          longitude 1.5
          price 9.99
          sprinkler_check_at '2016-01-01 15:00:00 +0000'
          check_in_at '2016-01-01 15:00:00 +0000'
          available_from '2016-01-01'
          fireplace true
        end
      end
      """
    And a file named "spec/features/user_views_apartments_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User views apartments' do
        scenario 'apartments are present' do
          apartment = create(:apartment)

          visit '/apartments'

          expect(page).to have_text(apartment.full_address)
          expect(page).to have_text(apartment.description)
          expect(page).to have_text(apartment.bedrooms)
          expect(page).to have_text(apartment.latitude)
          expect(page).to have_text(apartment.longitude)
          expect(page).to have_text(apartment.price)
          expect(page).to have_text(apartment.sprinkler_check_at)
          expect(page).to have_text(apartment.check_in_at)
          expect(page).to have_text(apartment.available_from)
          expect(page).to have_text(apartment.fireplace)
        end
      end
      """
    And a file named "spec/features/user_creates_apartment_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User creates an apartment' do
        scenario 'with valid parameters' do
          visit '/apartments'

          click_link 'New Apartment'

          fill_in 'Full address', with: 'MyString'
          fill_in 'Description', with: 'MyText'
          fill_in 'Bedrooms', with: '1'
          fill_in 'Latitude', with: '1.5'
          fill_in 'Longitude', with: '1.5'
          fill_in 'Price', with: '9.99'
          
          select '2016', from: 'apartment_sprinkler_check_at_1i'
          select 'January', from: 'apartment_sprinkler_check_at_2i'
          select '1', from: 'apartment_sprinkler_check_at_3i'
          select '15', from: 'apartment_sprinkler_check_at_4i'
          select '00', from: 'apartment_sprinkler_check_at_5i'

          select '15', from: 'apartment_check_in_at_4i'
          select '00', from: 'apartment_check_in_at_5i'

          select '2016', from: 'apartment_available_from_1i'
          select 'January', from: 'apartment_available_from_2i'
          select '1', from: 'apartment_available_from_3i'

          check 'Fireplace'
          click_button 'Create Apartment'

          expect(page).to have_text 'Apartment was successfully created.'
        end
      end
      """
    And a file named "spec/features/user_views_apartment_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User views an apartment' do
        scenario 'apartment exists' do
          apartment = create(:apartment)

          visit '/apartments'

          click_link 'Show'

          expect(page).to have_text(apartment.full_address)
          expect(page).to have_text(apartment.description)
          expect(page).to have_text(apartment.bedrooms)
          expect(page).to have_text(apartment.latitude)
          expect(page).to have_text(apartment.longitude)
          expect(page).to have_text(apartment.price)
          expect(page).to have_text(apartment.sprinkler_check_at)
          expect(page).to have_text(apartment.check_in_at)
          expect(page).to have_text(apartment.available_from)
          expect(page).to have_text(apartment.fireplace)
        end
      end
      """
    And a file named "spec/features/user_updates_apartment_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User updates an apartment' do
        scenario 'apartment exists' do
          create(:apartment)

          visit '/apartments'

          click_link 'Edit'

          fill_in 'Full address', with: 'Updated MyString'
          fill_in 'Description', with: 'Updated MyText'
          fill_in 'Bedrooms', with: '2'
          fill_in 'Latitude', with: '2.5'
          fill_in 'Longitude', with: '2.5'
          fill_in 'Price', with: '10.99'
          
          select '2016', from: 'apartment_sprinkler_check_at_1i'
          select 'December', from: 'apartment_sprinkler_check_at_2i'
          select '16', from: 'apartment_sprinkler_check_at_3i'
          select '20', from: 'apartment_sprinkler_check_at_4i'
          select '00', from: 'apartment_sprinkler_check_at_5i'

          select '20', from: 'apartment_check_in_at_4i'
          select '00', from: 'apartment_check_in_at_5i'

          select '2016', from: 'apartment_available_from_1i'
          select 'December', from: 'apartment_available_from_2i'
          select '16', from: 'apartment_available_from_3i'

          uncheck 'Fireplace'
          click_button 'Update Apartment'

          expect(page).to have_text 'Apartment was successfully updated.'
        end
      end
      """
    And a file named "spec/features/user_deletes_apartment_spec.rb" should contain exactly:
      """
      require 'rails_helper'

      RSpec.feature 'User deletes an apartment' do
        scenario 'apartment exists' do
          create(:apartment)

          visit '/apartments'

          click_link 'Destroy'

          expect(page).to have_text 'Apartment was successfully destroyed.'
        end
      end
      """
    And I run `rails generate scaffold Apartment full_address:string description:text bedrooms:integer latitude:float longitude:float price:decimal sprinkler_check_at:datetime check_in_at:time available_from:date fireplace:boolean --skip`
    And I run `rake db:migrate RAILS_ENV=test`
    When I run `bundle exec rspec spec/features`
    Then the examples should all pass
