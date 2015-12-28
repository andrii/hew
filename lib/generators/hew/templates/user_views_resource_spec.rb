require 'rails_helper'

RSpec.feature 'User views a post' do
  fixtures :posts

  scenario 'post exists' do
    post = posts(:post)

    visit '/posts'

    click_link 'Show'

    <%- attributes.each do |attribute| -%>
    expect(page).to have_text(post.<%= attribute.name %>)
    <%- end -%>
  end
end
