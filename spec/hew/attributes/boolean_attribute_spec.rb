require 'spec_helper'

describe Hew::Attributes::BooleanAttribute do
  let(:attribute) { Hew::Attributes::BooleanAttribute.new('apartment', 'fireplace') }

  it 'returns a create value' do
    _(attribute.create_value).must_equal true
  end

  it 'returns an update value' do
    _(attribute.update_value).must_equal false
  end

  it 'returns the Capybara action for entering the attribute create value' do
    _(attribute.create_action).must_equal "    check 'Fireplace'"
  end

  it 'returns the Capybara actions for entering the attribute update value' do
    _(attribute.update_action).must_equal "    uncheck 'Fireplace'"
  end
end
