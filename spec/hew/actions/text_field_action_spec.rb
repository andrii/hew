require 'spec_helper'

describe Hew::Actions::TextFieldAction do
  it 'renders the Capybara action for the given attribute/value' do
    attribute = OpenStruct.new(name: 'full_address')
    template = Hew::Actions::TextFieldAction.render(attribute, 'MyString')

    _(template).must_equal "fill_in 'Full address', with: 'MyString'"
  end
end
