require 'spec_helper'

describe Hew::Attributes::TimeAttribute do
  let(:attribute) { Hew::Attributes::TimeAttribute.new('apartment', 'check_in_at') }

  it 'returns a create value' do
    _(attribute.create_value.to_s).must_equal '2016-01-01 15:00:00 +0000'
  end

  it 'returns an update value' do
    _(attribute.update_value.to_s).must_equal '2016-12-16 20:00:00 +0000'
  end

  it 'returns the Capybara action for entering the attribute create value' do
    _(attribute.create_action).must_equal <<-RUBY.sub(/^\s{4}/, '')
    select '15', from: 'apartment_check_in_at_4i'
    select '00', from: 'apartment_check_in_at_5i'
    RUBY
  end

  it 'returns the Capybara actions for entering the attribute update value' do
    _(attribute.update_action).must_equal <<-RUBY.sub(/^\s{4}/, '')
    select '20', from: 'apartment_check_in_at_4i'
    select '00', from: 'apartment_check_in_at_5i'
    RUBY
  end
end
