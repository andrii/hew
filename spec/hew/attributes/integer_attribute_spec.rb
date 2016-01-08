require 'spec_helper'

describe Hew::Attributes::IntegerAttribute do
  let(:attribute) { Hew::Attributes::IntegerAttribute.new('apartment', 'bedrooms') }

  it 'returns a create value' do
    _(attribute.create_value).must_equal 1
  end

  it 'returns an update value' do
    _(attribute.update_value).must_equal 2
  end

  it 'returns the Capybara action for entering the attribute create value' do
    _(attribute.create_action).must_equal "fill_in 'Bedrooms', with: '1'"
  end

  it 'returns the Capybara actions for entering the attribute update value' do
    _(attribute.update_action).must_equal "fill_in 'Bedrooms', with: '2'"
  end
end
