require "db2c"

describe Db2c::Run do
  it "works with empty arguments" do
    Db2c::Run.new("").should be
  end
  it "defines helper boolean methods" do
    Db2c::Run.any_instance.stub(:die)
    Db2c::Run.new("").should_not be_version
    Db2c::Run.new("").should_not be_debug
    Db2c::Run.new("").should_not be_help
    Db2c::Run.new("").should_not be_nowrap

    Db2c::Run.new("-v").should be_version
    Db2c::Run.new("-d").should be_debug
    Db2c::Run.new("-h").should be_help
    Db2c::Run.new("--now").should be_nowrap

    Db2c::Run.new("version").should be_version
    Db2c::Run.new("debug").should be_debug
    Db2c::Run.new("help").should be_help
    Db2c::Run.new("--no-rlwrap").should be_nowrap

  end
  it "sets command debug flag" do
    Db2c::Command.should_not be_debug
    Db2c::Run.new("debug")
    Db2c::Command.should be_debug
  end
  it "outputs version" do
    Db2c::Run.any_instance.should_receive(:die).with("version #{Db2c::VERSION}")
    Db2c::Run.new("--version")
  end
end
