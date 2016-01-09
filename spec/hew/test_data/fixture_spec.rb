require 'spec_helper'

describe Hew::TestData::Fixture do
  it 'returns the filename' do
    file = Hew::TestData::Fixture.new('user', [])
    _(file.name).must_equal 'spec/fixtures/users.yml'
  end

  it 'returns the fixture file content' do
    attributes = [OpenStruct.new(name: 'full_name', create_value: 'FN-2187')]
    file = Hew::TestData::Fixture.new('user', attributes)

    _(file.content).must_equal <<-YAML
user:
  id: 1
  full_name: FN-2187
    YAML
  end
end
