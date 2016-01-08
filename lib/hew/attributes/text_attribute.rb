module Hew
  module Attributes
    class TextAttribute < Attribute
      def initialize(table_name, name)
        @create_value = 'MyText'
        @update_value = 'Updated MyText'
        super
      end

      private

      def action(value)
        Actions::TextFieldAction.render(self, value)
      end
    end
  end
end
