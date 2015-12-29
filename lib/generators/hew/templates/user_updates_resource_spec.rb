require 'rails_helper'

RSpec.feature 'User updates a <%= singular_name %>' do
  fixtures :<%= plural_name %>

  scenario '<%= singular_name %> exists' do
    <%= plural_name %>(:<%= singular_name %>)

    visit '/<%= plural_name %>'

    click_link 'Edit'

    <%- attributes.each do |attribute| -%>
    fill_in '<%= attribute.name.humanize %>', with: 'Updated <%= attribute.name.humanize %> <%= attribute.type.to_s.camelize %>'
    <%- end -%>
    click_button 'Update <%= human_name %>'

    expect(page).to have_text '<%= human_name %> was successfully updated.'
  end
end
