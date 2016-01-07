module Hew
  module Attributes
    class DateAttribute < Attribute
      attr_reader :table_name, :name, :create_value, :update_value

      def initialize(table_name, name)
        @table_name   = table_name
        @name         = name
        @create_value = Date.new(2016, 1, 1)
        @update_value = Date.new(2016, 12, 16)
      end

      private

      def action(value)
        Actions::DateFieldAction.render(self, value)
      end
    end
  end
end
