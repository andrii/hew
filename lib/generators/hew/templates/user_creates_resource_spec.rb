require 'rails_helper'

RSpec.feature 'User creates <%= @indefinitized_name %>' do
  scenario 'with valid parameters' do
    visit '/<%= plural_name %>'

    click_link 'New <%= human_name %>'

<%- attributes.each do |attribute| -%>
<%= attribute.create_action %>
<%- end -%>
    click_button 'Create <%= human_name %>'

    expect(page).to have_text '<%= human_name %> was successfully created.'
  end
end
