$:.unshift(File.expand_path("../", __FILE__))
require "skeleton/version"

module Skeleton
  autoload :Help, "skeleton/help"
  autoload :Command, "skeleton/command"
  autoload :RakeCommand, "skeleton/rake_command"
  autoload :CLI, "skeleton/cli"
  autoload :Sub, "skeleton/sub"
end
