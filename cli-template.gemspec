# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cli-template/version'

Gem::Specification.new do |spec|
  spec.name          = "cli-template"
  spec.version       = CliTemplate::VERSION
  spec.authors       = ["Tung Nguyen"]
  spec.email         = ["tongueroo@gmail.com"]
  spec.description   = %q{Generates a CLI tool quickly}
  spec.summary       = %q{Generates a CLI tool quickly}
  spec.homepage      = "https://gitub.com/tongueroo/cli-template"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_dependency "colorize"
  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  # spec.add_development_dependency "thor-vcr"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-bundler"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "byebug"
end
