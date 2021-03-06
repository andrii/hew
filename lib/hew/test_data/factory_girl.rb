module Hew
  module TestData
    class FactoryGirl < Library
      def file_name
        "spec/factories/#{table_name.pluralize}.rb"
      end

      def file_content
        yaml = ''
        yaml << "FactoryGirl.define do\n"
        yaml << "  factory :#{table_name} do\n"

        attributes.each do |attribute|
          yaml << "    #{attribute.name} #{format_value(attribute.create_value)}\n"
        end

        yaml << "  end\n"
        yaml << "end\n"
      end

      def create
        "create(:#{table_name})"
      end
    end
  end
end
