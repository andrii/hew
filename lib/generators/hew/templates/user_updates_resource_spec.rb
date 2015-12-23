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
