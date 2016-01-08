require 'spec_helper'

describe Hew::Attributes::FloatAttribute do
  let(:attribute) { Hew::Attributes::FloatAttribute.new('apartment', 'latitude') }

  it 'returns a create value' do
    _(attribute.create_value).must_equal 1.5
  end

  it 'returns an update value' do
    _(attribute.update_value).must_equal 2.5
  end

  it 'returns the Capybara action for entering the attribute create value' do
    _(attribute.create_action).must_equal "fill_in 'Latitude', with: '1.5'"
  end

  it 'returns the Capybara actions for entering the attribute update value' do
    _(attribute.update_action).must_equal "fill_in 'Latitude', with: '2.5'"
  end
end
