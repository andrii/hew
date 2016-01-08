require 'rails_helper'

RSpec.feature 'User views <%= plural_name %>' do
  fixtures :<%= plural_name %>

  scenario '<%= plural_name %> are present' do
    <%= singular_name %> = <%= plural_name %>(:<%= singular_name %>)

    visit '/<%= plural_name %>'

    <%- attributes.each do |attribute| -%>
    expect(page).to have_text(<%= singular_name %>.<%= attribute.name %>)
    <%- end -%>
  end
end
