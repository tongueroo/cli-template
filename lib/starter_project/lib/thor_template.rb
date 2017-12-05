$:.unshift(File.expand_path("../", __FILE__))
require "thor_template/version"

module ThorTemplate
  autoload :Help, "thor_template/help"
  autoload :Command, "thor_template/command"
  autoload :CLI, "thor_template/cli"
end
