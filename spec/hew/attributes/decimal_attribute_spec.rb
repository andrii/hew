require 'spec_helper'

describe Hew::Attributes::DecimalAttribute do
  let(:attribute) { Hew::Attributes::DecimalAttribute.new('apartment', 'price') }

  it 'returns a create value' do
    _(attribute.create_value).must_equal 9.99
  end

  it 'returns an update value' do
    _(attribute.update_value).must_equal 10.99
  end

  it 'returns the Capybara action for entering the attribute create value' do
    _(attribute.create_action).must_equal "    fill_in 'Price', with: '9.99'"
  end

  it 'returns the Capybara actions for entering the attribute update value' do
    _(attribute.update_action).must_equal "    fill_in 'Price', with: '10.99'"
  end
end
