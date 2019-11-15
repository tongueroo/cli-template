module CliTemplate
  class Git
    class << self
      def user_name
        sh "git config --get user.name"
      end

      def user_email
        sh "git config --get user.email"
      end

      def sh(command)
        puts "=> #{command}"
        stdout = `#{command}`
        out = stdout.strip
        puts "stdout #{stdout.inspect}"
        puts "out #{out.inspect}"
        return out if !out&.empty?
      end
    end
  end
end
