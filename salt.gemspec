# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'salt/version'

Gem::Specification.new do |spec|
  spec.name          = "salt"
  spec.version       = Salt::VERSION
  spec.authors       = ["Ari Lerner"]
  spec.email         = ["arilerner@mac.com"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  #{spec}.add_development_dependency "bundler", "~> 1.3"
  #{spec}.add_development_dependency "rake"

  %w(bundler rake vagrant-hostmaster vagrant virtualbox sshkey).each do |gem|
    spec.add_development_dependency gem
  end

  %w(active_support trollop i18n fog).each do |gem|
    spec.add_dependency gem
  end

end