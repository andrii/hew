module Hew
  module TestData
    class Library
      attr_reader :table_name, :attributes

      def initialize(table_name, attributes)
        @table_name = table_name
        @attributes = attributes
      end
    end
  end
end
