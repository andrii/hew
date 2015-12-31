require 'forwardable'

module Hew
  class Attribute
    extend Forwardable

    attr_reader :attribute

    def_delegators :@attribute, :name, :default

    def initialize(attribute)
      @attribute = attribute
    end

    def updated_value
      if [:string, :text].include?(attribute.type)
        "Updated #{attribute.default}"
      elsif attribute.type == :integer
        2
      end
    end
  end
end
