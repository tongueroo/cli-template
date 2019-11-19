module CliTemplate
  class Git
    class << self
      def user_name
        sh "git config --get user.name", mute: true
      end

      def user_email
        sh "git config --get user.email", mute: true
      end

      def sh(command, mute: false)
        puts "=> #{command}" unless mute
        stdout = `#{command}`
        out = stdout.strip
        return out if !out&.empty?
      end
    end
  end
end
