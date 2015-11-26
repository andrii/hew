module Hew
  module Generators
    class SpecsGenerator < Rails::Generators::NamedBase
      argument :attributes, type: :array, default: [], banner: "field[:type] field[:type]"

      def create_specs
        create_file 'spec/features/user_views_posts_spec.rb'
        create_file 'spec/features/user_creates_post_spec.rb'
        create_file 'spec/features/user_views_post_spec.rb'
        create_file 'spec/features/user_updates_post_spec.rb'
        create_file 'spec/features/user_deletes_post_spec.rb'
      end
    end
  end
end
