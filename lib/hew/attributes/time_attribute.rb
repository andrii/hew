module Hew
  module Attributes
    class TimeAttribute < Attribute
      def initialize(table_name, name)
        @create_value = Time.new(2016, 1, 1, 15, 0, 0, 0)
        @update_value = Time.new(2016, 12, 16, 20, 0, 0, 0)
        super
      end

      private

      def action(value)
        Actions::TimeFieldAction.for(self, value)
      end
    end
  end
end
