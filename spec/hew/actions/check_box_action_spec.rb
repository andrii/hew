require 'spec_helper'

describe Hew::Actions::CheckBoxAction do
  it 'returns the Capybara action for the given attribute/value' do
    attribute = OpenStruct.new(name: 'fireplace')

    template = Hew::Actions::CheckBoxAction.for(attribute, true)
    _(template).must_equal "check 'Fireplace'"

    template = Hew::Actions::CheckBoxAction.for(attribute, false)
    _(template).must_equal "uncheck 'Fireplace'"
  end
end
