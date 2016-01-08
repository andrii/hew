module Hew
  module Attributes
    class Attribute
      attr_reader :table_name, :name, :create_value, :update_value

      def initialize(table_name, name)
        @table_name = table_name
        @name = name
      end

      def create_action
        action(create_value)
      end

      def update_action
        action(update_value)
      end
    end
  end
end
