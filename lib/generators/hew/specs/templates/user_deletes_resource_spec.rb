require 'rails_helper'

Rspec.feature 'User deletes a post' do
  scenario 'post exists' do
    visit '/posts'

    click_link 'Destroy'

    expect(page).to have_text 'Post was successfully destroyed.'
  end
end
