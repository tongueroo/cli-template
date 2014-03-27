$:.unshift(File.expand_path("../", __FILE__))
require "thor_template/version"
require "thor/vcr" if ENV['VCR'] == '1'
require "thor_template/cli"

module ThorTemplate
  # Your code goes here...
end
