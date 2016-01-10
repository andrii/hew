module Hew
  module TestData
    class DataFile
      attr_reader :table_name, :attributes

      def initialize(table_name, attributes)
        @table_name = table_name
        @attributes = attributes
      end
    end
  end
end
