$:.unshift(File.expand_path("../", __FILE__))
require "version"
require "thor/vcr" if ENV['VCR'] == '1'
require "thor_template/cli"

module ThorTemplate
  # Your code goes here...
end
