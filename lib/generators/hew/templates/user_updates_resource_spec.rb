require 'rails_helper'

RSpec.feature 'User updates a post' do
  scenario 'post exists' do
    visit '/posts'

    click_link 'Edit'

    click_button 'Update Post'

    expect(page).to have_text 'Post was successfully updated.'
  end
end
