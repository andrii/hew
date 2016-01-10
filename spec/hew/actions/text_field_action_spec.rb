require 'spec_helper'

describe Hew::Actions::TextFieldAction do
  it 'returns the Capybara action for the given attribute/value' do
    attribute = OpenStruct.new(name: 'full_address')
    template = Hew::Actions::TextFieldAction.for(attribute, 'MyString')

    _(template).must_equal "fill_in 'Full address', with: 'MyString'"
  end
end
