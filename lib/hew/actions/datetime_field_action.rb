module Hew
  module Actions
    class DatetimeFieldAction
      def self.render(attribute, value)
        date_action = Actions::DateFieldAction.render(attribute, value)
        time_action = Actions::TimeFieldAction.render(attribute, value)

        "\n    #{date_action}    #{time_action}"
      end
    end
  end
end
