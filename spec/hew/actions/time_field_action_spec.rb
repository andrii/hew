require 'spec_helper'

describe Hew::Actions::TimeFieldAction do
  it 'returns the Capybara action for the given attribute/value' do
    value = Time.new(2016, 1, 1, 15, 0, 0, 0)
    attribute = OpenStruct.new(name: 'check_in_at')
    template = Hew::Actions::TimeFieldAction.for(attribute, value)

    _(template).must_equal <<-RUBY.sub(/^\s{4}/, '')
    select '15', from: 'apartment_check_in_at_4i'
    select '00', from: 'apartment_check_in_at_5i'
    RUBY
  end
end
