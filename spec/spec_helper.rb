ENV['TEST'] = '1'

# require 'simplecov'
# SimpleCov.start

require "pp"

root = File.expand_path('../../', __FILE__)
require "#{root}/lib/cli-template"

module Helpers
  def execute(cmd)
    puts "Running: #{cmd}" if show_command?
    out = `#{cmd}`
    puts out if show_command?
    out
  end

  # Added SHOW_COMMAND because DEBUG is also used by other libraries like
  # bundler and it shows its internal debugging logging also.
  def show_command?
    ENV['DEBUG'] || ENV['SHOW_COMMAND']
  end
end

RSpec.configure do |c|
  c.include Helpers
  c.before(:all) do
    FileUtils.rm_rf("tmp")
    FileUtils.mkdir_p("tmp")
  end
end
