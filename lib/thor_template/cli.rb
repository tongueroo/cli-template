module ThorTemplate
  class CLI < Command
    class_option :verbose, :type => :boolean
    class_option :noop, :type => :boolean

    desc "new NAME", "generates project based on thor template"
    long_desc Help.text(:new)
    def new(name)
      Generator.new(options.merge(name: name)).run
    end
  end
end
