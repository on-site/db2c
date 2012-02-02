require 'fileutils'
require 'tempfile'

module Db2c
  class Editor
    def self.edit editor
      puts "editor #{editor}" if $DB2CDBG
      @file ||= Tempfile.new(["db2_tempfile", ".sql"])
      mtime = File.stat(@file.path).mtime

      args = []
      args << command(editor)
      args << @file.path
      args.flatten!

      @file.close

      puts "editor args: #{args.inspect}" if $DB2CDBG

      system(*args)

      if mtime < File.stat(@file.path).mtime
        return IO.read(@file.path)
      end
    end

    def self.command editor
      return ["emacs", "-nw"] if editor =~ /^emacs/
      ["vi"]
    end

  end
end
