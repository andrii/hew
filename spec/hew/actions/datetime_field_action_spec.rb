require 'spec_helper'

describe Hew::Actions::DatetimeFieldAction do
  it 'renders the Capybara action for the given attribute/value' do
    attribute = OpenStruct.new(name: 'sprinkler_check_at')
    template = Hew::Actions::DatetimeFieldAction.render(attribute, Time.new(2016, 1, 1, 15, 0, 0, 0))

    _(template).must_equal <<-RUBY

    select '2016', from: 'apartment_sprinkler_check_at_1i'
    select 'January', from: 'apartment_sprinkler_check_at_2i'
    select '1', from: 'apartment_sprinkler_check_at_3i'
    select '15', from: 'apartment_sprinkler_check_at_4i'
    select '00', from: 'apartment_sprinkler_check_at_5i'
    RUBY
  end
end
