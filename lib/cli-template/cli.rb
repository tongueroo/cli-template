module CliTemplate
  class CLI < Command
    class_option :verbose, :type => :boolean
    class_option :noop, :type => :boolean

    long_desc Help.text(:new)
    option :repo, desc: "GitHub repo to use. Format: user/repo"
    option :force, type: :boolean, desc: "Bypass overwrite are you sure prompt for existing files."
    option :git, type: :boolean, default: true, desc: "Git initialize the project"
    register(New, "new", "new NAME", "generates new CLI project")

    desc "version", "prints version"
    def version
      puts VERSION
    end
  end
end
