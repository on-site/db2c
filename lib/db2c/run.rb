module Db2c
  class Run
    attr_reader :gdir

    def initialize *args
      @args = args
      puts "args: #{@args}" if debug?
      @gdir = File.expand_path('../../../', __FILE__)
      puts "cdir: #{@gdir}" if debug?
      Db2c::Command.debug = debug?
    end

    def help?
      !(@args & %w{-h help -help --help --man}).empty?
    end

    def debug?
      !(@args & %w{-d debug -debug --debug}).empty?
    end

    def wrap?
      (@args & %w{--no-rlwrap --now}).empty?
    end

    def autocomplete
      "#{@gdir}/lib/autocomplete"
    end

    def args
      @args.join(' ')
    end

    def die message
      puts message
      puts self.inspect if debug?
      exit
    end
  end
end
