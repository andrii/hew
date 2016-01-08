require 'spec_helper'

describe Hew::Attributes::TextAttribute do
  let(:attribute) { Hew::Attributes::TextAttribute.new('apartment', 'description') }

  it 'returns a create value' do
    _(attribute.create_value).must_equal 'MyText'
  end

  it 'returns an update value' do
    _(attribute.update_value).must_equal 'Updated MyText'
  end

  it 'returns the Capybara action for entering the attribute create value' do
    _(attribute.create_action).must_equal "fill_in 'Description', with: 'MyText'"
  end

  it 'returns the Capybara actions for entering the attribute update value' do
    _(attribute.update_action).must_equal "fill_in 'Description', with: 'Updated MyText'"
  end
end
