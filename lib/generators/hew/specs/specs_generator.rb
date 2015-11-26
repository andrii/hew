module Hew
  module Generators
    class SpecsGenerator < Rails::Generators::NamedBase
      argument :attributes, type: :array, default: [], banner: "field[:type] field[:type]"

      def create_specs
        create_file "spec/features/user_views_#{plural_name}_spec.rb"
        create_file "spec/features/user_creates_#{singular_name}_spec.rb"
        create_file "spec/features/user_views_#{singular_name}_spec.rb"
        create_file "spec/features/user_updates_#{singular_name}_spec.rb"
        create_file "spec/features/user_deletes_#{singular_name}_spec.rb"
      end
    end
  end
end
