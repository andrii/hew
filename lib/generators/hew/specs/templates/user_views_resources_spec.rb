require 'rails_helper'

RSpec.feature 'User views posts' do
  scenario 'posts are present' do
    visit '/posts'
  end
end
