module Db2c
  DEFAULT_PROMPT = "db2c => "
  VERSION = "1.0.0"
  module CONSTANTS
    DTSELECT = "select char(strip(tabschema) || '.' || strip(tabname), 128) as table from syscat.tables"
    DTORDER  = "order by tabschema, tabname"
  end
end

require "db2c/run.rb"
require "db2c/command.rb"
require "db2c/editor.rb"
