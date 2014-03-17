# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'church/version'

Gem::Specification.new do |spec|
  spec.name          = "church"
  spec.version       = Church::VERSION
  spec.authors       = ["Three If By Whiskey"]
  spec.email         = ["3ifbyw@gmail.com"]
  spec.summary       = %q{Church provides top-level constant Procs to do various and sundry kinds of functional programming.}
  spec.homepage      = "https://github.com/threeifbywhiskey/church"
  spec.license       = "WTFPL"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
