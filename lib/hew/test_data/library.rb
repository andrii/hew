module Hew
  module TestData
    class Library
      attr_reader :table_name, :attributes

      def initialize(table_name, attributes)
        @table_name = table_name
        @attributes = attributes
      end

      private

      def format_value(value)
        quote = %w(String Date Time).include?(value.class.to_s)
        quote ? "'#{value}'" : value
      end
    end
  end
end
