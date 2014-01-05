module ThorTemplate
  class CLI < Thor
    class Help
      class << self
        def stack_common(action)
<<-LONGDESC
      Adds a remote named <name> for the repository at <url>. The command git fetch <name> can then be used to create and update
LONGDESC
        end
      end
    end
  end
end