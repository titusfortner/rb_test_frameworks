# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rb_test_frameworks/version'

Gem::Specification.new do |spec|
  spec.name          = "rb_test_frameworks"
  spec.version       = RbTestFrameworks::VERSION
  spec.authors       = ["Titus Fortner"]
  spec.email         = ["titusfortner@gmail.com"]

  spec.summary       = %q{Test Framework Comparison}
  spec.description   = %q{Examples of each of the different Test Framework and Page Object Iimplementations in Ruby}
  spec.homepage      = "http://github.com/titusfortner"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "watirmark"
  spec.add_development_dependency "capybara"
  spec.add_development_dependency "selenium_fury"
  spec.add_development_dependency "page-object"
  spec.add_development_dependency "watirsome"
  spec.add_development_dependency "watir_drops"
end
