# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'turlang/version'

Gem::Specification.new do |spec|
  spec.name          = "turlang"
  spec.version       = Turlang::VERSION
  spec.authors       = ["Dean"]
  spec.email         = ["deangalvin3@gmail.com"]

  spec.summary       = %q{ Write a short summary, because Rubygems requires one.}
  spec.description   = %q{ Write a longer description or delete this line.}
  spec.homepage      = "https://www.github.com/FreekingDean/turlang"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = "turlang"
  spec.require_paths = ["lib"]
end
