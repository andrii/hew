require 'spec_helper'

describe Hew::Attributes::DatetimeAttribute do
  let(:attribute) { Hew::Attributes::DatetimeAttribute.new('apartment', 'sprinkler_check_at') }

  it 'returns a create value' do
    _(attribute.create_value.to_s).must_equal '2016-01-01 15:00:00 +0000'
  end

  it 'returns an update value' do
    _(attribute.update_value.to_s).must_equal '2016-12-16 20:00:00 +0000'
  end

  it 'returns the Capybara action for entering the attribute create value' do
    _(attribute.create_action).must_equal <<-RUBY

    select '2016', from: 'apartment_sprinkler_check_at_1i'
    select 'January', from: 'apartment_sprinkler_check_at_2i'
    select '1', from: 'apartment_sprinkler_check_at_3i'
    select '15', from: 'apartment_sprinkler_check_at_4i'
    select '00', from: 'apartment_sprinkler_check_at_5i'
    RUBY
  end

  it 'returns the Capybara actions for entering the attribute update value' do
    _(attribute.update_action).must_equal <<-RUBY

    select '2016', from: 'apartment_sprinkler_check_at_1i'
    select 'December', from: 'apartment_sprinkler_check_at_2i'
    select '16', from: 'apartment_sprinkler_check_at_3i'
    select '20', from: 'apartment_sprinkler_check_at_4i'
    select '00', from: 'apartment_sprinkler_check_at_5i'
    RUBY
  end
end
