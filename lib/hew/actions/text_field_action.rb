module Hew
  module Actions
    class TextFieldAction
      def self.for(attribute, value)
        name = attribute.name.humanize

        "fill_in '#{name}', with: '#{value}'"
      end
    end
  end
end
