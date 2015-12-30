class HewGenerator < Rails::Generators::NamedBase
  argument :attributes, type: :array, default: [], banner: "field[:type] field[:type]"

  source_root File.expand_path("../templates", __FILE__)

  def create_specs
    @indefinitized_name = indefinitize(singular_name)

    template 'fixture.yml', "spec/fixtures/#{plural_name}.yml"
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
end
