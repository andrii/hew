require 'spec_helper'

describe Hew::Attributes::StringAttribute do
  let(:attribute) { Hew::Attributes::StringAttribute.new('apartment', 'full_address') }

  it 'returns a create value' do
    _(attribute.create_value).must_equal 'MyString'
  end

  it 'returns an update value' do
    _(attribute.update_value).must_equal 'Updated MyString'
  end

  it 'returns the Capybara action for entering the attribute create value' do
    _(attribute.create_action).must_equal "    fill_in 'Full address', with: 'MyString'"
  end

  it 'returns the Capybara actions for entering the attribute update value' do
    _(attribute.update_action).must_equal "    fill_in 'Full address', with: 'Updated MyString'"
  end
end
