# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'db2c'

Gem::Specification.new do |s|
  s.name          = "db2c"
  s.version       = Db2c::VERSION
  s.platform      = Gem::Platform::RUBY
  s.date          = Time.now.strftime('%Y-%m-%d')
  s.summary       = "a smarter db2 console"
  s.description   = "a db2 console with with history and autocomplete support, and few other goodies"
  s.homepage      = "http://github.com/on-site/db2c"
  s.email         = "samer@on-siteNOSPAM.com"
  s.authors       = ["Samer Abukhait"]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
end
