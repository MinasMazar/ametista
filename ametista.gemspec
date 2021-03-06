# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ametista/version'

Gem::Specification.new do |spec|
  spec.name          = "ametista"
  spec.version       = Ametista::VERSION
  spec.authors       = ["MinasMazar"]
  spec.email         = ["minasmazar@gmail.com"]
  spec.summary       = ""
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  #spec.add_dependency "fileutils"
  spec.add_dependency "thor", "~> 0.19"
  spec.add_dependency "mechanize", "~> 2.7"

  spec.add_dependency "pry"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

end
