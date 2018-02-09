$:.unshift(File.expand_path("../", __FILE__))
require "thor/vcr" if ENV['VCR'] == '1'
require "thor_template/version"

module ThorTemplate
  autoload :Help, 'thor_template/help'
  autoload :Command, 'thor_template/command'
  autoload :Version, 'thor_template/version'
  autoload :Sequence, 'thor_template/sequence'
  autoload :New, 'thor_template/new'
end
