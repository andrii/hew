module Hew
  module Attributes
    class DateAttribute < Attribute
      def initialize(table_name, name)
        @create_value = Date.new(2016, 1, 1)
        @update_value = Date.new(2016, 12, 16)
        super
      end

      private

      def action(value)
        Actions::DateFieldAction.for(self, value)
      end
    end
  end
end
