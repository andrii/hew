require 'rails_helper'

RSpec.feature 'User views a post' do
  scenario 'post exists' do
    visit '/posts'

    click_link 'Show'
  end
end
