module Hew
  module Attributes
    class IntegerAttribute < Attribute
      def initialize(table_name, name)
        @create_value = 1
        @update_value = 2
        super
      end

      private

      def action(value)
        Actions::TextFieldAction.for(self, value)
      end
    end
  end
end
