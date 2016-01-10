module Hew
  module Attributes
    class StringAttribute < Attribute
      def initialize(table_name, name)
        @create_value = 'MyString'
        @update_value = 'Updated MyString'
        super
      end

      private

      def action(value)
        Actions::TextFieldAction.for(self, value)
      end
    end
  end
end
