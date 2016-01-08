module Hew
  module Attributes
    class FloatAttribute < Attribute
      def initialize(table_name, name)
        @create_value = 1.5
        @update_value = 2.5
        super
      end

      private

      def action(value)
        Actions::TextFieldAction.render(self, value)
      end
    end
  end
end
