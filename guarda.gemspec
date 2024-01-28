# frozen_string_literal: true

require_relative "lib/guarda/version"

Gem::Specification.new do |spec|
  spec.name = "guarda"
  spec.version = Guarda::VERSION
  spec.authors = ["Abdullah Hashim"]
  spec.email = ["abdul@hey.com"]

  spec.summary = "Another authorization gem"
  spec.homepage = "https://wwww.guidedrails.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Guided-Rails/guarda"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "activesupport", "~> 7.1", ">= 7.1.3"
  spec.add_development_dependency "minitest-reporters", "~> 1.6", ">= 1.6.1"
end
