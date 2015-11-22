module Hew
  module Generators
    class SpecsGenerator < Rails::Generators::NamedBase
      argument :attributes, type: :array, default: [], banner: "field[:type] field[:type]"
    end
  end
end
