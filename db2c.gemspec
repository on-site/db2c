$LOAD_PATH.unshift 'lib'
require "db2c/version"

Gem::Specification.new do |s|
  s.name              = "db2c"
  s.version           = Db2c::VERSION
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "a db2 console with with history and autocomplete support"
  s.description       = "a db2 console with with history and autocomplete support"
  s.homepage          = "http://github.com/on-site/db2c"
  s.email             = "samer@on-siteNOSPAM.com"
  s.authors           = [ "Samer Abukhait" ]
  s.has_rdoc          = false

  s.files             = %w( README.md Rakefile LICENSE )
  s.files            += Dir.glob("bin/**/*")
  s.files            += Dir.glob("man/**/*")

  s.executables       = %w( db2c )
end
