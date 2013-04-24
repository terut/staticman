# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'staticman/version'

Gem::Specification.new do |gem|
  gem.name          = "staticman"
  gem.version       = Staticman::VERSION
  gem.authors       = ["terut"]
  gem.email         = ["terut.dev+github@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'activesupport', ['>= 3.2.0']
  gem.add_dependency 'actionpack', ['>= 3.2.0']

  gem.add_development_dependency 'bundler', ['>= 1.0.0']
  gem.add_development_dependency 'rake', ['>= 0']
  gem.add_development_dependency 'sqlite3', ['>= 0']
  gem.add_development_dependency 'rspec', ['>= 0']
end
