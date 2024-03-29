# frozen_string_literal: true

require_relative "lib/log_reader/version"

Gem::Specification.new do |spec|
  spec.name = "log_reader"
  spec.version = LogReader::VERSION
  spec.authors = ["Paul Anthony McGowan"]
  spec.email = ["xhostcom@gmail.com"]

  spec.summary = "A Server Log Reader/Parser"
  spec.homepage = "https://www.xhostcom.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://example.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/xhostcomweb/rails-log-reader-gem.git"
  spec.metadata["changelog_uri"] = "https://github.com/xhostcomweb/rails-log-reader-gem/wiki/Changelog"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
