# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman_ember_scaffold/version'

Gem::Specification.new do |spec|
  spec.name          = "mes"
  spec.version       = MiddlemanEmberScaffold::VERSION
  spec.authors       = ["j-mcnally"]
  spec.email         = ["justin@kohactive.com"]
  spec.description   = "A scaffolding tool for EmberJS / Middleman / Emblem (HAML for Handlebars) / Bootstrap"
  spec.summary       = "A scaffolding tool for EmberJS"
  spec.homepage      = "https://github.com/j-mcnally/mes"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency("thor", ["~> 0.17.0"])
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
