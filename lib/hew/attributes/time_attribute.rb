module Hew
  module Attributes
    class TimeAttribute < Attribute
      attr_reader :table_name, :name, :create_value, :update_value

      def initialize(table_name, name)
        @table_name   = table_name
        @name         = name
        @create_value = Time.new(2016, 1, 1, 15, 0, 0, 0)
        @update_value = Time.new(2016, 12, 16, 20, 0, 0, 0)
      end

      private

      def action(value)
        Actions::TimeFieldAction.render(self, value)
      end
    end
  end
end
