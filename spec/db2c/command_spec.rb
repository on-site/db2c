require 'db2c'

describe Db2c::Command do

  include Db2c::CONSTANTS

  def command_check(command, translation)
    Db2c::Command.new(command).to_s.should == translation
  end

  it 'supports \q' do
    Db2c::Command.new('\q').should be_quit
    Db2c::Command.new('\quit').should be_quit
  end
  it 'supports history commands' do
    Db2c::Command.new('\hist').should be_history
  end
  it 'supports help command' do
    Db2c::Command.new('\help').should be_help
    Db2c::Command.new('\h').should be_help
  end
  it 'strips db2 if any' do
    command_check('db2 do something', 'do something')
    Db2c::Command.new('db2 do something').should be_valid
  end
  it 'supports use *' do
    command_check 'use somedb', 'connect to somedb'
  end
  it 'supports describe tablei_name' do
    command_check 'describe schema.table', 'describe table schema.table'
  end
  it 'supports \d tale_name' do
    command_check '\d schema.table', 'describe table schema.table'
  end
  it 'supports \l' do
    command_check '\l', 'list database directory'
  end
  it 'supports \lt' do
    command_check '\lt', 'list tables'
  end
  it 'supports \lt all' do
    command_check '\lt all', 'list tables for all'
  end
  it 'supports \lt schema' do
    command_check '\lt hr', 'list tables for schema hr'
  end

  describe "\d[a|s|t|v]" do
    it "returns a list of tables for all schemas without any arguments" do
      command_check '\dt', "#{DTSELECT} where type = 'T' #{DTORDER}"
    end
    it "returns a list of views for all schemas without any arguments" do
      command_check '\dv', "#{DTSELECT} where type = 'V' #{DTORDER}"
    end
    it "returns a list of tables for a specific schema" do
      command_check '\dt hr', "#{DTSELECT} where type = 'T' and tabschema = 'HR' #{DTORDER}"
    end
    it "returns a list of aliases for a specific schema" do
      command_check '\da hr', "#{DTSELECT} where type = 'A' and tabschema = 'HR' #{DTORDER}"
    end
  end
end
