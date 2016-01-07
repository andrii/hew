module Hew
  module Attributes
    class Attribute
      def create_action
        action(create_value)
      end

      def update_action
        action(update_value)
      end
    end
  end
end
