lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hew/version'

Gem::Specification.new do |s|
  s.name     = 'hew'
  s.version  = Hew::VERSION
  s.summary  = 'CRUD acceptance test scaffolding for Rails'
  s.author   = 'Andrii Ponomarov'
  s.email    = 'andrii.ponomarov@gmail.com'
  s.homepage = 'http://github.com/andrii/hew'
  s.license  = 'MIT'
  s.files    = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec|features)/}) }

  s.add_development_dependency 'aruba', '~> 0.12.0'
  s.add_development_dependency 'rake', '~> 10.5'
  s.add_development_dependency 'minitest', '~> 5.8'
  s.add_development_dependency 'activesupport', '>=3'
end
