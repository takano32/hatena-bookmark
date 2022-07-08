# frozen_string_literal: true

require_relative "lib/hatena/bookmark/version"

Gem::Specification.new do |spec|
  spec.name = "hatena-bookmark"
  spec.version = Hatena::Bookmark::VERSION
  spec.authors = ["TAKANO Mitsuhiro"]
  spec.email = ["takano32@gmail.com"]

  spec.summary = "Hatena Bookmark"
  spec.description = "Access Hatena Bookmark via OAuth"
  spec.homepage = "https://github.com/takano32/hatena-bookmark-client"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.2"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

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

  spec.add_dependency 'faraday'

  # DEPRECATION
  # https://github.com/lostisland/faraday_middleware
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'simple_oauth'

  spec.add_development_dependency 'dotenv'
end
