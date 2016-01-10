module Hew
  module Attributes
    class BooleanAttribute < Attribute
      def initialize(table_name, name)
        @create_value = true
        @update_value = false
        super
      end

      private

      def action(value)
        Actions::CheckBoxAction.for(self, value)
      end
    end
  end
end
