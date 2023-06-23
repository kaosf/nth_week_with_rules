# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nth_week_with_rules/version'

Gem::Specification.new do |spec|
  spec.name          = "nth_week_with_rules"
  spec.version       = NthWeekWithRules::VERSION
  spec.authors       = ["ka"]
  spec.email         = ["ka.kaosf@gmail.com"]

  spec.summary       = %q{Calculate n-th week of the date with some rules}
  spec.description   = %q{Calculate n-th week of the date with some rules}
  spec.homepage      = "https://github.com/kaosf/nth_week_with_rules"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.4"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "test-unit", "~> 3.1"
  spec.add_development_dependency "test-unit-notify", "~> 1.0"
  spec.add_development_dependency "guard", "~> 2.13"
  spec.add_development_dependency "guard-minitest", "~> 2.4"
end
