require 'hew/attribute'
require 'minitest/autorun'

describe Hew::Attribute do
  it 'returns attribute name' do
    attribute = OpenStruct.new(name: 'full_address')
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.name).must_equal 'full_address'
  end

  it 'returns default value' do
    attribute = OpenStruct.new(default: 'MyString')
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.default).must_equal 'MyString'
  end

  it 'returns an updated value for string attribute' do
    attribute = OpenStruct.new(type: :string, default: 'MyString')
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.updated_value).must_equal 'Updated MyString'
  end

  it 'returns an updated value for text attribute' do
    attribute = OpenStruct.new(type: :text, default: 'MyText')
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.updated_value).must_equal 'Updated MyText'
  end

  it 'returns an updated value for integer attribute' do
    attribute = OpenStruct.new(type: :integer)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.updated_value).must_equal 2
  end
end
