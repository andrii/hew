require 'forwardable'

module Hew
  class Attribute
    extend Forwardable

    attr_reader :attribute

    def_delegators :@attribute, :name

    def initialize(attribute)
      @attribute = attribute
    end

    def default
      case attribute.type
      when :string then 'MyString'
      when :text then 'MyText'
      when :integer then 1
      when :float then 1.5
      when :decimal then 9.99
      when :datetime then Time.new(2016, 1, 1, 0, 0, 0, 0)
      end
    end

    def update_value
      case attribute.type
      when :string, :text then "Updated #{default}"
      when :integer then 2
      when :float then 2.5
      when :decimal then 10.99
      when :datetime then Time.new(2016, 12, 16, 20, 0, 0, 0)
      end
    end

    def create_actions
      actions(default)
    end

    def update_actions
      actions(update_value)
    end

    private

    def actions(value)
      if [:string, :text, :integer, :float, :decimal].include?(attribute.type)
        "    fill_in '#{attribute.name.humanize}', with: '#{value}'"
      elsif attribute.type == :datetime
        <<-RUBY

    select '#{value.strftime('%Y')}', from: 'apartment_sprinkler_check_at_1i'
    select '#{value.strftime('%B')}', from: 'apartment_sprinkler_check_at_2i'
    select '#{value.strftime('%-d')}', from: 'apartment_sprinkler_check_at_3i'
    select '#{value.strftime('%H')}', from: 'apartment_sprinkler_check_at_4i'
    select '#{value.strftime('%M')}', from: 'apartment_sprinkler_check_at_5i'
        RUBY
      end
    end
  end
end
