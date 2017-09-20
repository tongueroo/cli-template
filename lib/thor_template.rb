$:.unshift(File.expand_path("../", __FILE__))
require "thor/vcr" if ENV['VCR'] == '1'
require "thor_template/cli"

module ThorTemplate
  autoload :Command, 'thor_template/command'
  autoload :Version, 'thor_template/version'
  autoload :Generator, 'thor_template/generator'
  autoload :Renamer, 'thor_template/renamer'
end
