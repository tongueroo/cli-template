module ThorTemplate
  class CLI < Thor
    class Help
      class << self
        def hello
<<-EOL
Hello world example
EOL
        end
      end
    end
  end
end