require 'rails_helper'

RSpec.feature 'User updates a post' do
  fixtures :posts

  scenario 'post exists' do
    posts(:post)

    visit '/posts'

    click_link 'Edit'

    <%- attributes.each do |attribute| -%>
    fill_in '<%= attribute.name.humanize %>', with: 'Updated <%= attribute.name.humanize %> <%= attribute.type.to_s.camelize %>'
    <%- end -%>
    click_button 'Update Post'

    expect(page).to have_text 'Post was successfully updated.'
  end
end
