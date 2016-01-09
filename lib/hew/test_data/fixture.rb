module Hew
  module TestData
    class Fixture
      attr_reader :table_name, :attributes

      def initialize(table_name, attributes)
        @table_name = table_name
        @attributes = attributes
      end

      def name
        "spec/fixtures/#{table_name.pluralize}.yml"
      end

      def content
        yaml = ''
        yaml << "#{table_name}:\n"
        yaml << "  id: 1\n"

        attributes.each do |attribute|
          yaml << "  #{attribute.name}: #{attribute.create_value}\n"
        end

        yaml
      end
    end
  end
end
