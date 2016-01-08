require 'rails_helper'

RSpec.feature 'User updates <%= @indefinitized_name %>' do
  fixtures :<%= plural_name %>

  scenario '<%= singular_name %> exists' do
    <%= plural_name %>(:<%= singular_name %>)

    visit '/<%= plural_name %>'

    click_link 'Edit'

    <%- @attributes.each do |attribute| -%>
    <%= attribute.update_action %>
    <%- end -%>
    click_button 'Update <%= human_name %>'

    expect(page).to have_text '<%= human_name %> was successfully updated.'
  end
end
