require 'spec_helper'

describe Hew::Actions::DateFieldAction do
  it 'renders the Capybara action for the given attribute/value' do
    attribute = OpenStruct.new(name: 'available_from')
    template = Hew::Actions::DateFieldAction.render(attribute, Date.new(2016, 1, 1))

    _(template).must_equal <<-RUBY.sub(/^\s{4}/, '')
    select '2016', from: 'apartment_available_from_1i'
    select 'January', from: 'apartment_available_from_2i'
    select '1', from: 'apartment_available_from_3i'
    RUBY
  end
end
