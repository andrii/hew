require 'spec_helper'

describe Hew::TestData::Fixtures do
  it 'returns the filename' do
    file = Hew::TestData::Fixtures.new('user', [])
    _(file.file_name).must_equal 'spec/fixtures/users.yml'
  end

  it 'returns the fixture file content' do
    attributes = [OpenStruct.new(name: 'full_name', create_value: 'FN-2187')]
    file = Hew::TestData::Fixtures.new('user', attributes)

    _(file.file_content).must_equal <<-YAML
user:
  id: 1
  full_name: FN-2187
    YAML
  end

  it 'returns the create statement' do
    test_data = Hew::TestData::Fixtures.new('user', [])
    _(test_data.create).must_equal 'users(:user)'
  end
end
