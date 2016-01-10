require 'spec_helper'

describe Hew::TestData::Fixtures do
  it 'returns the filename' do
    test_data = Hew::TestData::Fixtures.new('user', [])
    _(test_data.file_name).must_equal 'spec/fixtures/users.yml'
  end

  it 'returns the fixture file content' do
    attributes = [OpenStruct.new(name: 'full_name', create_value: 'FN-2187')]
    test_data = Hew::TestData::Fixtures.new('user', attributes)

    _(test_data.file_content).must_equal <<-YAML
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
