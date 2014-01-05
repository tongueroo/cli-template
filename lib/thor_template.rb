$:.unshift(File.expand_path("../thor_template", __FILE__))
require "version"
require "thor/vcr" if ENV['VCR'] == '1'

module ThorTemplate
  # Your code goes here...
end
