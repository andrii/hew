module Hew
  module Attributes
    class IntegerAttribute < Attribute
      attr_reader :table_name, :name, :create_value, :update_value

      def initialize(table_name, name)
        @table_name   = table_name
        @name         = name
        @create_value = 1
        @update_value = 2
      end

      private

      def action(value)
        Actions::TextFieldAction.render(self, value)
      end
    end
  end
end
