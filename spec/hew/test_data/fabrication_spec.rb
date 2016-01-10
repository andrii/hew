require 'spec_helper'

describe Hew::TestData::Fabrication do
  it 'returns the filename' do
    test_data = Hew::TestData::Fabrication.new('user', [])
    _(test_data.file_name).must_equal 'spec/fabricators/user_fabricator.rb'
  end

  it 'returns the factory file content' do
    attrs = {
      full_address: 'MyString',
      description: 'MyText',
      bedrooms: 1,
      latitude: 1.5,
      longitude: 1.5,
      price: 9.99,
      sprinkler_check_at: '2016-01-01 15:00:00 +0000',
      check_in_at: '2016-01-01 15:00:00 +0000',
      available_from: '2016-01-01',
      fireplace: true
    }

    attributes = attrs.each.map { |name, value| OpenStruct.new(name: name, create_value: value) }
    test_data = Hew::TestData::Fabrication.new('apartment', attributes)

    _(test_data.file_content).must_equal <<-YAML
Fabricator(:apartment) do
  full_address 'MyString'
  description 'MyText'
  bedrooms 1
  latitude 1.5
  longitude 1.5
  price 9.99
  sprinkler_check_at '2016-01-01 15:00:00 +0000'
  check_in_at '2016-01-01 15:00:00 +0000'
  available_from '2016-01-01'
  fireplace true
end
    YAML
  end

  it 'returns the create statement' do
    test_data = Hew::TestData::Fabrication.new('user', [])
    _(test_data.create).must_equal 'Fabricate(:user)'
  end
end
