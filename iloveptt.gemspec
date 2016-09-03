# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iloveptt/version'

Gem::Specification.new do |spec|
  spec.name          = "iloveptt"
  spec.version       = Iloveptt::VERSION
  spec.authors       = ["gaga5lala"]
  spec.email         = ["gaga5lala1013@gmail.com"]

  spec.summary       = "Download images from ptt beauty"
  spec.description   = "Download images from ptt beauty, inspired by tzangms and kkdai"
  spec.homepage      = "https://github.com/gaga5lala/iloveptt"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
