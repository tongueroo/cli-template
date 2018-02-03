require 'thor'

module ThorTemplate
  class Command < Thor
    class << self
      def dispatch(m, args, options, config)
        # Allow calling for help via:
        #   thor_template command help
        #   thor_template command -h
        #   thor_template command --help
        #   thor_template command -D
        #
        # as well thor's normal way:
        #
        #   thor_template help command
        help_flags = Thor::HELP_MAPPINGS + ["help"]
        if args.length > 1 && !(args & help_flags).empty?
          args -= help_flags
          args.insert(-2, "help")
        end

        #   thor_template version
        #   thor_template --version
        #   thor_template -v
        version_flags = ["--version", "-v"]
        if args.length == 1 && !(args & version_flags).empty?
          args = ["version"]
        end

        super
      end
    end
  end
end
