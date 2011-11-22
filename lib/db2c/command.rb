module Db2c
  class Command

    @@cdb = ''
    @@debug = false

    def initialize input
      if input
        puts "initializing: #{input}" if @@debug
        @input = input.chomp.strip
        @input.gsub! /^db2 /i, ''
        @input.gsub! /;$/, ''
        @input.gsub! /^use /, 'connect to '
        @input.insert 0, "? sql" if @input =~ /^\-\d+$/
        @input.insert 0, "? " if @input =~ /^\d+$/
        @input.insert 0, "values " if @input =~ /^current.+$/i
      end
    end

    def to_s
      @input
    end

    def quit?
      @input.nil? || @input =~ /^(exit|quit)$/
    end

    def valid?
      @input && @input.length > 0
    end

    def execute
      puts "executing: #{@input}" if @@debug
      system 'db2', @input if valid?
      if @input =~ /^connect to (.*)$/i
        @@cdb = $1.downcase
      end
      if @input =~ /^disconnect #{@@cdb}$/i || @input =~ /^connect reset$/i
        @@cdb = ''
      end
    end

    def self.debug=(value)
      @@debug = value
    end

    def self.debug?
      @@debug
    end

    def self.prompt
      "db2c".tap do |pr|
        pr << "(#{@@cdb})" if @@cdb.length > 0
        pr << " => "
      end
    end

  end
end
