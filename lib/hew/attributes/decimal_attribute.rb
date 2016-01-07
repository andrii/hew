module Hew
  module Attributes
    class DecimalAttribute < Attribute
      attr_reader :table_name, :name, :create_value, :update_value

      def initialize(table_name, name)
        @table_name   = table_name
        @name         = name
        @create_value = 9.99
        @update_value = 10.99
      end

      private

      def action(value)
        Actions::TextFieldAction.render(self, value)
      end
    end
  end
end
