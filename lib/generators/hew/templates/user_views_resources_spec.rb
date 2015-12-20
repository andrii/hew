require 'rails_helper'

RSpec.feature 'User views posts' do
  scenario 'posts are present' do
    post = posts(:post)

    visit '/posts'

    <%- attributes.each do |attribute| -%>
    expect(page).to have_text(post.<%= attribute.name %>)
    <%- end -%>
  end
end
