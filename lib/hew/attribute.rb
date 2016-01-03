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
      when :datetime, :time then Time.new(2016, 1, 1, 15, 0, 0, 0)
      end
    end

    def update_value
      case attribute.type
      when :string, :text then "Updated #{default}"
      when :integer then 2
      when :float then 2.5
      when :decimal then 10.99
      when :datetime, :time then Time.new(2016, 12, 16, 20, 0, 0, 0)
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

    select '#{value.strftime('%Y')}', from: 'apartment_#{name}_1i'
    select '#{value.strftime('%B')}', from: 'apartment_#{name}_2i'
    select '#{value.strftime('%-d')}', from: 'apartment_#{name}_3i'
    select '#{value.strftime('%H')}', from: 'apartment_#{name}_4i'
    select '#{value.strftime('%M')}', from: 'apartment_#{name}_5i'
        RUBY
      elsif attribute.type == :time
        <<-RUBY
    select '#{value.strftime('%H')}', from: 'apartment_#{name}_4i'
    select '#{value.strftime('%M')}', from: 'apartment_#{name}_5i'
        RUBY
      end
    end
  end
end
