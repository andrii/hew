module Hew
  module Actions
    class DateFieldAction
      def self.render(attribute, value)
        name  = attribute.name
        year  = value.strftime('%Y')
        month = value.strftime('%B')
        day   = value.strftime('%-d')

        <<-RUBY.sub(/^\s{4}/, '')
    select '#{year}', from: 'apartment_#{name}_1i'
    select '#{month}', from: 'apartment_#{name}_2i'
    select '#{day}', from: 'apartment_#{name}_3i'
        RUBY
      end
    end
  end
end
