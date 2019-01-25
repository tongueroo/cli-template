require 'active_support/core_ext/string'
require 'bundler'
require 'fileutils'
require 'rainbow'
require 'thor'
require 'rainbow/ext/string'

class CliTemplate::Sequence < Thor::Group
  include Thor::Actions
  include CliTemplate::Helper

  def self.source_root
    template = ENV['TEMPLATE'] || 'default'
    File.expand_path("../../templates/#{template}", __FILE__)
  end

private
  def clone_project
    unless git_installed?
      abort "Unable to detect git installation on your system.  Git needs to be installed in order to use the --repo option."
    end

    if File.exist?(project_name)
      abort "The folder #{project_name} already exists."
    else
      run "git clone https://github.com/#{options[:repo]} #{project_name}"
    end
    confirm_cli_project
  end

  def confirm_cli_project
    cli_project = File.exist?("#{project_name}/config/application.rb")
    unless cli_project
      puts "It does not look like the repo #{options[:repo]} is a cli project. Maybe double check that it is?  Exited.".colorize(:red)
      exit 1
    end
  end

  def copy_project
    puts "Creating new project called #{project_name}."
    directory ".", project_name
  end

  def git_installed?
    system("type git > /dev/null")
  end
end
