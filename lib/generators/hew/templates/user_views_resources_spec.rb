require 'rails_helper'

RSpec.feature 'User views posts' do
  scenario 'posts are present' do
    post = posts(:post)

    visit '/posts'

    <%- unless attributes.blank? -%>
    expect(page).to have_text(post.title)
    <%- end -%>
  end
end
