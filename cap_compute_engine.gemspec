# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cap_compute_engine/version'

Gem::Specification.new do |spec|
  spec.name          = "cap_compute_engine"
  spec.version       = CapComputeEngine::VERSION
  spec.authors       = ["kotohata"]
  spec.email         = ["kotohata@attracie.com"]
  spec.summary       = %q{Cap production deploy}
  spec.description   = %q{Cap production deploy}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
