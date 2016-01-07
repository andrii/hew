module Hew
  module Attributes
    class DatetimeAttribute < Attribute
      attr_reader :table_name, :name, :create_value, :update_value

      def initialize(table_name, name)
        @table_name   = table_name
        @name         = name
        @create_value = Time.new(2016, 1, 1, 15, 0, 0, 0)
        @update_value = Time.new(2016, 12, 16, 20, 0, 0, 0)
      end

      private

      def action(value)
        date_action = Actions::DateFieldAction.render(self, value)
        time_action = Actions::TimeFieldAction.render(self, value)

        "\n" + date_action + time_action
      end
    end
  end
end
