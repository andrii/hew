module Hew
  module Attributes
    class BooleanAttribute < Attribute
      attr_reader :table_name, :name, :create_value, :update_value

      def initialize(table_name, name)
        @table_name   = table_name
        @name         = name
        @create_value = true
        @update_value = false
      end

      private

      def action(value)
        Actions::CheckBoxAction.render(self, value)
      end
    end
  end
end
