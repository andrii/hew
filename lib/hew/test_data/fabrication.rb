module Hew
  module TestData
    class Fabrication < Library
      def file_name
        "spec/fabricators/#{table_name}_fabricator.rb"
      end

      def file_content
        yaml = ''
        yaml << "Fabricator(:#{table_name}) do\n"

        attributes.each do |attribute|
          yaml << "  #{attribute.name} #{format_value(attribute.create_value)}\n"
        end

        yaml << "end\n"
      end

      def create
        "Fabricate(:#{table_name})"
      end
    end
  end
end
