module Hew
  module TestData
    class Fixtures < DataFile
      def file_name
        "spec/fixtures/#{table_name.pluralize}.yml"
      end

      def file_content
        yaml = ''
        yaml << "#{table_name}:\n"
        yaml << "  id: 1\n"

        attributes.each do |attribute|
          yaml << "  #{attribute.name}: #{attribute.create_value}\n"
        end

        yaml
      end

      def create
        "#{table_name.pluralize}(:#{table_name})"
      end
    end
  end
end
