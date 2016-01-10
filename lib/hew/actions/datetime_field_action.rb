module Hew
  module Actions
    class DatetimeFieldAction
      def self.for(attribute, value)
        date_action = Actions::DateFieldAction.for(attribute, value)
        time_action = Actions::TimeFieldAction.for(attribute, value)

        "\n    #{date_action}    #{time_action}"
      end
    end
  end
end
