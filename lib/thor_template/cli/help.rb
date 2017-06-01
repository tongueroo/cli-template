module ThorTemplate
  class CLI < Command
    class Help
      class << self
        def generate
<<-EOL
Examples:

$ thor_template new hello

$ thor_template new another_project
EOL
        end
      end
    end
  end
end
