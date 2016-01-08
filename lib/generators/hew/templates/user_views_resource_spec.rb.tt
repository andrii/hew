require 'rails_helper'

RSpec.feature 'User views <%= @indefinitized_name %>' do
  fixtures :<%= plural_name %>

  scenario '<%= singular_name %> exists' do
    <%= singular_name %> = <%= plural_name %>(:<%= singular_name %>)

    visit '/<%= plural_name %>'

    click_link 'Show'

    <%- attributes.each do |attribute| -%>
    expect(page).to have_text(<%= singular_name %>.<%= attribute.name %>)
    <%- end -%>
  end
end
