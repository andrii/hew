require 'rails_helper'

RSpec.feature 'User deletes <%= @indefinitized_name %>' do
  fixtures :<%= plural_name %>

  scenario '<%= singular_name %> exists' do
    <%= plural_name %>(:<%= singular_name %>)

    visit '/<%= plural_name %>'

    click_link 'Destroy'

    expect(page).to have_text '<%= human_name %> was successfully destroyed.'
  end
end
