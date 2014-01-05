require 'thor'
require 'cli/help'

module ThorTemplate

  class Remote < Thor
    desc "add <name> <url>", "Adds a remote named <name> for the repository at <url>"
    long_desc Help.remote_add
    option :t, :banner => "<branch>"
    option :m, :banner => "<master>"
    options :f => :boolean, :tags => :boolean, :mirror => :string
    def add(name, url)
      # implement git remote add
    end
 
    desc "rename <old> <new>", "Rename the remote named <old> to <new>"
    def rename(old, new)
    end
  end

  class CLI < Thor
    class_option :verbose, :type => :boolean

    desc "hello NAME", "say hello to NAME"
    option :from, :desc => 'from person'
    def hello(name)
      puts "from: #{options[:from]}" if options[:from]
      puts "Hello #{name}"
    end

    desc "fetch <repository> [<refspec>...]", "Download objects and refs from another repository"
    options :all => :boolean, :multiple => :boolean
    option :append, :type => :boolean, :aliases => :a, :desc => 'desc'
    def fetch(respository, *refspec)
      # implement git fetch here
    end
 
    desc "remote SUBCOMMAND ...ARGS", "manage set of tracked repositories"
    subcommand "remote", Remote
  end
end