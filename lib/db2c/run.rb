module Db2c
  class Run
    attr_reader :gdir

    def initialize *args
      @args = args
      puts "args: #{@args.inspect}" if debug?
      @gdir = File.expand_path('../../../', __FILE__)
      puts "cdir: #{@gdir.inspect}" if debug?
      Db2c::Command.debug = debug?

      die "version #{Db2c::VERSION}" if version?
      die "The db2 command was not found!" unless system("which db2 > /dev/null 2> /dev/null")
      die "This program depends on rlwrap, please install rlwrap" unless nowrap? || system("which rlwrap > /dev/null 2> /dev/null")
    end

    def help?
      !(@args & %w{-h help -help --help man --man}).empty?
    end
    def version?
      !(@args & %w{-v version -version --version}).empty?
    end
    def debug?
      !(@args & %w{-d debug -debug --debug}).empty?
    end
    def nowrap?
      !(@args & %w{--no-rlwrap --now}).empty?
    end

    def default_db
      words.first if words.length == 1 && words.first !~ /(help|man|debug|version)/
    end

    def autocomplete
      "#{@gdir}/lib/autocomplete"
    end

    def args
      @args.join(' ')
    end

    def words
      @args.reject { |arg| arg.start_with?('-') }
    end

    def die message
      puts "DB2C: #{message}"
      puts "DB2C: #{self.inspect}" if debug?
      exit
    end
  end
end
