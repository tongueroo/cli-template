module CliTemplate
  class New < Sequence
    argument :project_name

    def create_project
      options[:repo] ? clone_project : copy_project

      destination_root = "#{Dir.pwd}/#{project_name}"
      self.destination_root = destination_root
      FileUtils.cd("#{Dir.pwd}/#{project_name}")
    end

    def make_executable
      chmod("bin", 0755 & ~File.umask, verbose: false) if File.exist?("bin")
      chmod("exe", 0755 & ~File.umask, verbose: false) if File.exist?("exe")
    end

    def bundle_install
      Bundler.with_clean_env do
        system("BUNDLE_IGNORE_CONFIG=1 bundle install")
      end
    end

    def git_init
      return if !options[:git]
      return unless git_installed?
      return if File.exist?(".git") # this is a clone repo

      run("git init")
      run("git add .")
      run("git commit -m 'first commit'")
    end

    def user_message
      puts <<-EOL
#{"="*64}
Congrats 🎉 You have successfully created a CLI project.

Test the CLI:

  cd #{project_name}
  exe/#{project_name} hello       # top-level commands
  exe/#{project_name} sub:goodbye # sub commands
  bundle exec rspec

To publish your CLI as a gem:

  1. edit the #{project_name}.gemspec
  2. edit lib/#{project_name}/version.rb
  3. update the CHANGELOG.md

And run:

  rake release

EOL
    end
  end
end
