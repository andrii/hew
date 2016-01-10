module Hew
  module Actions
    class CheckBoxAction
      def self.for(attribute, value)
        name   = attribute.name.humanize
        action = value ? 'check' : 'uncheck'

        "#{action} '#{name}'"
      end
    end
  end
end
