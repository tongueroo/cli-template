require 'fileutils'
require 'colorize'
require 'active_support/core_ext/string'
require "byebug"

module ThorTemplate
  class Generator
    attr_reader :options
    def initialize(options={})
      @options = options
      Dir.chdir(options[:cwd]) if options[:cwd]
      @name = options[:name]
    end

    def run
      copy
      rename
      git
      puts "Created #{@name} project!"
    end

    def copy
      project_root = @name
      source_root = File.expand_path("../../starter_project", __FILE__)
      paths = Dir.glob("#{source_root}/**/{*,.*}").
                select {|p| File.file?(p) }
      paths.each do |src|
        dest = src.gsub(%r{.*starter_project/},'')
        dest = "#{project_root}/#{dest}"

        if File.exist?(dest) and !options[:force]
          puts "already exists: #{dest}".colorize(:yellow) unless options[:quiet]
        else
          puts "creating: #{dest}".colorize(:green) unless options[:quiet]
          dirname = File.dirname(dest)
          FileUtils.mkdir_p(dirname) unless File.exist?(dirname)
          FileUtils.cp(src, dest)
        end
      end
    end

    def rename
      Renamer.new(@name).rename!
    end

    def git
      system("cd #{@name} && git init")
      system("cd #{@name} && git add .")
      system("cd #{@name} && git commit -m 'first commit'")
    end

private
    def template(src,dest)
      templates = File.expand_path("../../templates", __FILE__)
      FileUtils.cp("#{templates}/#{src}", "#{@name}/#{dest}")
    end
  end
end
