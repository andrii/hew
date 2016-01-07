module Hew
  module Actions
    class TimeFieldAction
      def self.render(attribute, value)
        name   = attribute.name
        hour   = value.strftime('%H')
        minute = value.strftime('%M')

        <<-RUBY
    select '#{hour}', from: 'apartment_#{name}_4i'
    select '#{minute}', from: 'apartment_#{name}_5i'
        RUBY
      end
    end
  end
end
