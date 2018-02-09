module ThorTemplate
  class CLI < Command
    class_option :verbose, :type => :boolean
    class_option :noop, :type => :boolean

    long_desc Help.text(:new)
    New.cli_options.each do |args|
      option *args
    end
    register(New, "new", "new", "generates new CLI project")

    desc "version", "prints version"
    def version
      puts VERSION
    end
  end
end
