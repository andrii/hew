require 'spec_helper'

describe Hew::Attributes::DateAttribute do
  let(:attribute) { Hew::Attributes::DateAttribute.new('apartment', 'available_from') }

  it 'returns a create value' do
    _(attribute.create_value.to_s).must_equal '2016-01-01'
  end

  it 'returns an update value' do
    _(attribute.update_value.to_s).must_equal '2016-12-16'
  end

  it 'returns the Capybara action for entering the attribute create value' do
    _(attribute.create_action).must_equal <<-RUBY.sub(/^\s{4}/, '')
    select '2016', from: 'apartment_available_from_1i'
    select 'January', from: 'apartment_available_from_2i'
    select '1', from: 'apartment_available_from_3i'
    RUBY
  end

  it 'returns the Capybara actions for entering the attribute update value' do
    _(attribute.update_action).must_equal <<-RUBY.sub(/^\s{4}/, '')
    select '2016', from: 'apartment_available_from_1i'
    select 'December', from: 'apartment_available_from_2i'
    select '16', from: 'apartment_available_from_3i'
    RUBY
  end
end
