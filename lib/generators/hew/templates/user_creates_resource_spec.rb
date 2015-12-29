require 'rails_helper'

RSpec.feature 'User creates a <%= singular_name %>' do
  scenario 'with valid parameters' do
    visit '/<%= plural_name %>'

    click_link 'New <%= human_name %>'

    <%- attributes.each do |attribute| -%>
    fill_in '<%= attribute.name.humanize %>', with: '<%= attribute.name.humanize %> <%= attribute.type.to_s.camelize %>'
    <%- end -%>
    click_button 'Create <%= human_name %>'

    expect(page).to have_text '<%= human_name %> was successfully created.'
  end
end
