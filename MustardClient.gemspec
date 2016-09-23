# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'MustardClient/version'

Gem::Specification.new do |spec|
  spec.name          = "mustard_client"
  spec.version       = MustardClient::VERSION
  spec.authors       = ["Matt Watson"]
  spec.email         = ["matt.watson@orasi.com"]

  spec.summary       = %q{Ruby Client for Mustard Results Server}
  spec.description   = %q{Ruby Client for Mustard Results Server}
  spec.homepage      = "https://github.com/Orasi/Mustard-Ruby"
  spec.license       = "BSD"

  spec.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE)
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
