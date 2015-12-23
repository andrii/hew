require 'rails_helper'

RSpec.feature 'User views a post' do
  fixtures :posts

  scenario 'post exists' do
    posts(:post)

    visit '/posts'

    click_link 'Show'
  end
end
