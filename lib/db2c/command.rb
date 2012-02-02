module Db2c
  class Command

    @@cdb = ''

    def initialize input
      if input
        puts "initializing: #{input}" if $DB2CDBG
        @input = input.chomp.strip.gsub(/^db2 /i,'')
        parse unless @input =~ /^(select|update|delete|insert)/i
      end
    end

    def to_s
      @input
    end

    def parse
      @input.gsub! /^use /, 'connect to '

      @input.gsub! /^\\d /, 'describe '
      if @input =~ /describe [^. ]+\.[^.+ ]+/
        @input.gsub! /describe /, 'describe table '
        return
      end

      if @input =~ /^(show|list) databases/ || @input == '\l'
        @input = "list database directory"
        return
      end

      if @input =~ /^\\lt ?(\w*)$/
        @input = "list tables"
        unless $1.empty?
          @input += $1 == "all" ? " for all" : " for schema #{$1}"
        end
        return
      end

      shortcuts
    end

    def shortcuts
      prepend /^\-\d+$/, "? sql"
      prepend /^\d+$/, "? "
      prepend /^current.+$/i, "values "
    end

    def prepend regex, value
      @input.insert 0, value if @input =~ regex
    end

    def quit?
      @input.nil? || @input =~ /^(exit|quit|\\q|\\quit)$/
    end

    def history?
      @input =~ /^(history|hist|\\history|\\hist)$/
    end

    def help?
      @input =~ /^(help|h|\\help|\\h)$/
    end

    def valid?
      !quit? && !history? && !help?
    end

    def execute
      puts "executing: #{@input}" if $DB2CDBG
      system 'db2', @input if valid?
      if @input =~ /^connect to (.*)$/i
        @@cdb = $1.downcase
      end
      if @input =~ /^disconnect #{@@cdb}$/i || @input =~ /^connect reset$/i
        @@cdb = ''
      end
    end

    def self.prompt
      "db2c".tap do |pr|
        pr << "(#{@@cdb})" if @@cdb.length > 0
        pr << " => "
      end
    end

    def self.execute command
      new(command).execute
    end

  end
end
