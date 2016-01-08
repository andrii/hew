module Hew
  module Actions
    class TextFieldAction
      def self.render(attribute, value)
        name = attribute.name.humanize

        "fill_in '#{name}', with: '#{value}'"
      end
    end
  end
end
