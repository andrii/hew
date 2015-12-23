Gem::Specification.new do |s|
  s.name    = 'hew'
  s.version = '0.0.1'
  s.summary = 'Acceptance test scaffolding for Rails'
  s.author  = 'Andrii Ponomarov'
  s.add_runtime_dependency 'rails'
  s.add_development_dependency 'aruba'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'sqlite3'
end
