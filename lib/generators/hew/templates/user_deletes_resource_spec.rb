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
