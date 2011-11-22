require 'db2c'

describe Db2c::Command do
  it 'strips db2 if any' do
    Db2c::Command.new('db2 do something').to_s.should == 'do something'
    Db2c::Command.new('db2 do something').should be_valid
  end
  it 'supports use *' do
    Db2c::Command.new('use somedb').to_s.should == 'connect to somedb'
  end
  it 'supports describe tablei_name' do
    Db2c::Command.new('describe schema.table').to_s.should == 'describe table schema.table'
  end
  it 'supports \d tale_name' do
    Db2c::Command.new('\d schema.table').to_s.should == 'describe table schema.table'
  end
  it 'supports \q' do
    Db2c::Command.new('\q').should be_quit
    Db2c::Command.new('\quit').should be_quit
  end
  it 'supports history command' do
    Db2c::Command.new('history').should be_history
  end
end
