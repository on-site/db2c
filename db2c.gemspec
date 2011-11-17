# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'db2c'

Gem::Specification.new do |s|
  s.name         = "db2c"
  s.version      = Db2c::VERSION
  s.platform     = Gem::Platform::RUBY
  s.date         = Time.now.strftime('%Y-%m-%d')
  s.summary      = "a db2 console with with history and autocomplete support"
  s.description  = "This program wraps db2 command mode with a repl, and wraps that repl with rlwrap"
  s.homepage     = "http://github.com/on-site/db2c"
  s.email        = "samer@on-siteNOSPAM.com"
  s.authors      = ["Samer Abukhait"]
  s.files        = Dir.glob("{bin,lib,man}/**/*") + %w(LICENSE README.md Rakefile)
  s.executables  = ['db2c']
  s.require_path = 'lib'
end
