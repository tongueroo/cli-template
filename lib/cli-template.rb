$:.unshift(File.expand_path("../", __FILE__))
require "thor/vcr" if ENV['VCR'] == '1'
require "cli-template/version"

module CliTemplate
  autoload :Help, 'cli-template/help'
  autoload :Command, 'cli-template/command'
  autoload :Version, 'cli-template/version'
  autoload :Sequence, 'cli-template/sequence'
  autoload :New, 'cli-template/new'
  autoload :Helpers, 'cli-template/helpers'
end
