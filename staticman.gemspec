# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'staticman/version'

Gem::Specification.new do |gem|
  gem.name          = "staticman"
  gem.version       = Staticman::VERSION
  gem.authors       = ["terut"]
  gem.email         = ["terut.dev+github@gmail.com"]
  gem.description   = %q{Staticman build static pages, e.g. errors, about, contact, and it's very easy, fast, programable}
  gem.summary       = %q{A builder for static pages with template engine}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  %w{ actionpack activesupport railties }.each do |g|
    gem.add_dependency g, ['>= 3.2.0']
  end

  gem.add_development_dependency 'bundler', ['>= 1.0.0']
  gem.add_development_dependency 'rake', ['>= 0']
  gem.add_development_dependency 'tzinfo', ['>= 0']
  gem.add_development_dependency 'rspec', ['>= 0']
  gem.add_development_dependency 'pry', ['>= 0']
end
