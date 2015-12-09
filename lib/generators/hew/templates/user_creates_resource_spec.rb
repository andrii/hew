require 'rails_helper'

RSpec.feature 'User creates a post' do
  scenario 'with valid parameters' do
    visit '/posts'

    click_link 'New Post'

    click_button 'Create Post'

    expect(page).to have_text 'Post was successfully created.'
  end
end
