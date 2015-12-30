require 'rails_helper'

RSpec.feature 'User updates <%= singular_name %>' do
  fixtures :<%= plural_name %>

  scenario '<%= singular_name %> exists' do
    <%= plural_name %>(:<%= singular_name %>)

    visit '/<%= plural_name %>'

    click_link 'Edit'

    <%- attributes.each do |attribute| -%>
    <% if attribute.type == :integer %>fill_in '<%= attribute.name.humanize %>', with: '2'<% else %>fill_in '<%= attribute.name.humanize %>', with: 'Updated <%= attribute.default %>'<% end %>
    <%- end -%>
    click_button 'Update <%= human_name %>'

    expect(page).to have_text '<%= human_name %> was successfully updated.'
  end
end
