require 'rails_helper'

RSpec.feature 'User creates a post' do
  scenario 'with valid parameters' do
    visit '/posts'

    click_link 'New Post'

    <%- attributes.each do |attribute| -%>
    fill_in '<%= attribute.name.humanize %>', with: '<%= attribute.name.humanize %> <%= attribute.type.to_s.camelize %>'
    <%- end -%>
    click_button 'Create Post'

    expect(page).to have_text 'Post was successfully created.'
  end
end
