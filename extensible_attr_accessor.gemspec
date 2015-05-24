# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'extensible_attr_accessor/version'

Gem::Specification.new do |spec|
  spec.name          = "extensible_attr_accessor"
  spec.version       = ExtensibleAttrAccessor::VERSION
  spec.authors       = ["Jkr2255"]
  spec.email         = ["magnesium.oxide.play@gmail.com"]

  spec.summary       = %q{attr_xxx extension accepting blocks.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
