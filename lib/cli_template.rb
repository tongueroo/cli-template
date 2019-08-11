$:.unshift(File.expand_path("../", __FILE__))
require "cli_template/version"
require "cli_template/autoloader"
CliTemplate::Autoloader.setup

module CliTemplate
  class Error < StandardError; end
end
