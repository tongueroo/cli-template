$:.unshift(File.expand_path("../", __FILE__))
require "thor_template/version"
require "thor/vcr" if ENV['VCR'] == '1'

module ThorTemplate
  autoload :CLI, 'thor_template/cli'
end
