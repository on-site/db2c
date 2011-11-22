$LOAD_PATH.unshift 'lib'
require "db2c"

def version
  Db2c::VERSION
end

def git(command)
  system("git #{command}")
end

desc "Build and install gem"
task :build do
  sh "gem build db2c.gemspec"
  sh "gem install db2c-#{version}.gem"
end

desc "Push new version"
task :publish do
  git "tag v#{version}"
  git "push origin v#{version}"
  git "push origin master"
  git "push origin master:latest"
  sh "gem build db2c.gemspec"
  sh "gem push db2c-#{version}.gem"
  git "clean -fd"
end
