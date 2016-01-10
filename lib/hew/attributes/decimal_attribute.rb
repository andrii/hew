module Hew
  module Attributes
    class DecimalAttribute < Attribute
      def initialize(table_name, name)
        @create_value = 9.99
        @update_value = 10.99
        super
      end

      private

      def action(value)
        Actions::TextFieldAction.for(self, value)
      end
    end
  end
end
