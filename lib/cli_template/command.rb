require 'thor'

# Override thor's long_desc identation behavior
# https://github.com/erikhuda/thor/issues/398
class Thor
  module Shell
    class Basic
      def print_wrapped(message, options = {})
        message = "\n#{message}" unless message[0] == "\n"
        stdout.puts message
      end
    end
  end
end

module CliTemplate
  class Command < Thor
    class << self
      def dispatch(m, args, options, config)
        # Allow calling for help via:
        #   cli-template command help
        #   cli-template command -h
        #   cli-template command --help
        #   cli-template command -D
        #
        # as well thor's normal way:
        #
        #   cli-template help command
        help_flags = Thor::HELP_MAPPINGS + ["help"]
        if args.length > 1 && !(args & help_flags).empty?
          args -= help_flags
          args.insert(-2, "help")
        end

        #   cli-template version
        #   cli-template --version
        #   cli-template -v
        version_flags = ["--version", "-v"]
        if args.length == 1 && !(args & version_flags).empty?
          args = ["version"]
        end

        super
      end
    end

    # https://github.com/erikhuda/thor/issues/244
    # Deprecation warning: Thor exit with status 0 on errors. To keep this behavior, you must define `exit_on_failure?` in `Lono::CLI`
    # You can silence deprecations warning by setting the environment variable THOR_SILENCE_DEPRECATION.
    no_commands do
      def exit_on_failure?
        true
      end
    end
  end
end
