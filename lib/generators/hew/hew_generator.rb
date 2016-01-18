require 'hew'

class HewGenerator < Rails::Generators::NamedBase
  LIBRARIES = %w(fixtures factory_girl fabrication)

  argument     :attributes, type: :array, default: [],
                            banner: 'field[:type] field[:type]'

  class_option :test_data,  type: :string, aliases: '-F', default: 'fixtures',
                            desc: "Indicates the test data library (options: #{LIBRARIES.join('/')})"

  source_root File.expand_path('../templates', __FILE__)

  def create_specs
    @indefinitized_name = indefinitize(singular_name)
    @attributes = attributes.map { |attr| hew_attribute(attr) }
    @test_data = test_data_class.new(singular_name, attributes)

    add_file @test_data.file_name, @test_data.file_content
    template 'user_views_resources_spec.rb', "spec/features/user_views_#{plural_name}_spec.rb"
    template 'user_creates_resource_spec.rb', "spec/features/user_creates_#{singular_name}_spec.rb"
    template 'user_views_resource_spec.rb', "spec/features/user_views_#{singular_name}_spec.rb"
    template 'user_updates_resource_spec.rb', "spec/features/user_updates_#{singular_name}_spec.rb"
    template 'user_deletes_resource_spec.rb', "spec/features/user_deletes_#{singular_name}_spec.rb"
  end

  private

  def indefinitize(word)
    article = word =~ /^[aeiou]/i ? 'an' : 'a'
    "#{article} #{word}"
  end

  def hew_attribute(attribute)
    klass = hew_attribute_class(attribute)
    klass.new(singular_name, attribute.name)
  end

  def hew_attribute_class(attribute)
    "Hew::Attributes::#{attribute.type.to_s.camelize}Attribute".constantize
  rescue NameError
    Hew::Attributes::UnsupportedAttribute
  end

  def test_data_class
    library = options['test_data']

    "Hew::TestData::#{library.camelize}".constantize
  rescue NameError
    raise Thor::Error, "#{library} library is not supported. Supported options are: #{LIBRARIES.join('/')}."
  end
end
