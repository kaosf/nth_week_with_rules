# frozen_string_literal: true

require_relative "lib/nth_week_with_rules/version"

Gem::Specification.new do |spec|
  spec.name = "nth_week_with_rules"
  spec.version = NthWeekWithRules::VERSION
  spec.authors = ["ka"]
  spec.email = ["ka.kaosf@gmail.com"]

  spec.summary = "Calculate n-th week of the date with some rules"
  spec.description = "Calculate n-th week of the date with some rules"
  spec.homepage = "https://github.com/kaosf/nth_week_with_rules"
  spec.license = "MIT"

  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/kaosf/nth_week_with_rules"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").filter do |f|
      f.start_with?(*%w[lib/ LICENSE])
    end
  end
  # spec.bindir = "exe"
  # spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # There is no dependency now.

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
