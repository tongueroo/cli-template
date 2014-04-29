require 'thor'
require 'thor_template/cli/help'

module ThorTemplate

  class CLI < Thor
    class_option :verbose, :type => :boolean
    class_option :noop, :type => :boolean

    desc "new NAME", "generates project based on thor template"
    def new(name)
      Generator.new(options.merge(name: name)).run
    end

  end
end