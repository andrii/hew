require 'hew/attribute'
require 'minitest/autorun'
require 'minitest/pride'
require 'active_support/core_ext/string'

describe Hew::Attribute do
  it 'returns attribute name' do
    attribute = OpenStruct.new(name: 'full_address')
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.name).must_equal 'full_address'
  end

  it 'returns a default value for string attribute' do
    attribute = OpenStruct.new(type: :string)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.default).must_equal 'MyString'
  end

  it 'returns a default value for text attribute' do
    attribute = OpenStruct.new(type: :text)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.default).must_equal 'MyText'
  end

  it 'returns a default value for integer attribute' do
    attribute = OpenStruct.new(type: :integer)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.default).must_equal 1
  end

  it 'returns a default value for float attribute' do
    attribute = OpenStruct.new(type: :float)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.default).must_equal 1.5
  end

  it 'returns a default value for decimal attribute' do
    attribute = OpenStruct.new(type: :decimal)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.default).must_equal 9.99
  end

  it 'returns a default value for datetime attribute' do
    attribute = OpenStruct.new(type: :datetime)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.default.to_s).must_equal '2016-01-01 15:00:00 +0000'
  end

  it 'returns a default value for time attribute' do
    attribute = OpenStruct.new(type: :time)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.default.to_s).must_equal '2016-01-01 15:00:00 +0000'
  end

  it 'returns a new value for string attribute' do
    attribute = OpenStruct.new(type: :string)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.update_value).must_equal 'Updated MyString'
  end

  it 'returns a new value for text attribute' do
    attribute = OpenStruct.new(type: :text)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.update_value).must_equal 'Updated MyText'
  end

  it 'returns a new value for integer attribute' do
    attribute = OpenStruct.new(type: :integer)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.update_value).must_equal 2
  end

  it 'returns a new value for float attribute' do
    attribute = OpenStruct.new(type: :float)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.update_value).must_equal 2.5
  end

  it 'returns a new value for decimal attribute' do
    attribute = OpenStruct.new(type: :decimal)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.update_value).must_equal 10.99
  end

  it 'returns a new value for datetime attribute' do
    attribute = OpenStruct.new(type: :datetime)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.update_value.to_s).must_equal '2016-12-16 20:00:00 +0000'
  end

  it 'returns a new value for time attribute' do
    attribute = OpenStruct.new(type: :time)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.update_value.to_s).must_equal '2016-12-16 20:00:00 +0000'
  end

  it 'returns capybara actions for entering a new string attribute' do
    attribute = OpenStruct.new(name: 'full_address', type: :string)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.create_actions).must_equal "    fill_in 'Full address', with: 'MyString'"
  end

  it 'returns capybara actions for entering a new text attribute' do
    attribute = OpenStruct.new(name: 'description', type: :text)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.create_actions).must_equal "    fill_in 'Description', with: 'MyText'"
  end

  it 'returns capybara actions for entering a new integer attribute' do
    attribute = OpenStruct.new(name: 'bedrooms', type: :integer)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.create_actions).must_equal "    fill_in 'Bedrooms', with: '1'"
  end

  it 'returns capybara actions for entering a new float attribute' do
    attribute = OpenStruct.new(name: 'latitude', type: :float)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.create_actions).must_equal "    fill_in 'Latitude', with: '1.5'"
  end

  it 'returns capybara actions for entering a new decimal attribute' do
    attribute = OpenStruct.new(name: 'price', type: :decimal)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.create_actions).must_equal "    fill_in 'Price', with: '9.99'"
  end

  it 'returns capybara actions for entering a new datetime attribute' do
    attribute = OpenStruct.new(name: 'sprinkler_check_at', type: :datetime)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.create_actions).must_equal <<-RUBY

    select '2016', from: 'apartment_sprinkler_check_at_1i'
    select 'January', from: 'apartment_sprinkler_check_at_2i'
    select '1', from: 'apartment_sprinkler_check_at_3i'
    select '15', from: 'apartment_sprinkler_check_at_4i'
    select '00', from: 'apartment_sprinkler_check_at_5i'
    RUBY
  end

  it 'returns capybara actions for entering a new time attribute' do
    attribute = OpenStruct.new(name: 'check_in_at', type: :time)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.create_actions).must_equal <<-RUBY
    select '15', from: 'apartment_check_in_at_4i'
    select '00', from: 'apartment_check_in_at_5i'
    RUBY
  end

  it 'returns capybara actions for updating an existing string attribute' do
    attribute = OpenStruct.new(name: 'full_address', type: :string)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.update_actions).must_equal "    fill_in 'Full address', with: 'Updated MyString'"
  end

  it 'returns capybara actions for updating an existing text attribute' do
    attribute = OpenStruct.new(name: 'description', type: :text)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.update_actions).must_equal "    fill_in 'Description', with: 'Updated MyText'"
  end

  it 'returns capybara actions for updating an existing integer attribute' do
    attribute = OpenStruct.new(name: 'bedrooms', type: :integer)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.update_actions).must_equal "    fill_in 'Bedrooms', with: '2'"
  end

  it 'returns capybara actions for updating an existing float attribute' do
    attribute = OpenStruct.new(name: 'latitude', type: :float)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.update_actions).must_equal "    fill_in 'Latitude', with: '2.5'"
  end

  it 'returns capybara actions for updating an existing decimal attribute' do
    attribute = OpenStruct.new(name: 'price', type: :decimal)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.update_actions).must_equal "    fill_in 'Price', with: '10.99'"
  end

  it 'returns capybara actions for updating an existing datetime attribute' do
    attribute = OpenStruct.new(name: 'sprinkler_check_at', type: :datetime)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.update_actions).must_equal <<-RUBY

    select '2016', from: 'apartment_sprinkler_check_at_1i'
    select 'December', from: 'apartment_sprinkler_check_at_2i'
    select '16', from: 'apartment_sprinkler_check_at_3i'
    select '20', from: 'apartment_sprinkler_check_at_4i'
    select '00', from: 'apartment_sprinkler_check_at_5i'
    RUBY
  end

  it 'returns capybara actions for updating an existing time attribute' do
    attribute = OpenStruct.new(name: 'check_in_at', type: :time)
    hew_attribute = Hew::Attribute.new(attribute)
    _(hew_attribute.update_actions).must_equal <<-RUBY
    select '20', from: 'apartment_check_in_at_4i'
    select '00', from: 'apartment_check_in_at_5i'
    RUBY
  end
end
