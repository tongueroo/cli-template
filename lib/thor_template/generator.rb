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
      Dir.chdir(@name) do
        Dir.glob("**/*") do |path|
          next unless File.file?(path)
          rename_content(path)

          next unless File.file?(path)
          rename_path(path)
        end # Dir.glob

        remove_empty_directories
      end
    end

    def rename_content(path)
      content = IO.readlines(path)
      result = content.map do |line|
        line = line.gsub(/ThorTemplate/, @name.underscore.camelize)
        line = line.gsub(/thor_template/, @name.underscore)
        line = line.gsub("USER_PROVIDED_NAME", @name) # special case
        line
      end
      IO.write(path, result.join(''))
    end

    def rename_path(src)
      dest = if special_rename?(src)
        src.gsub(/thor_template/, @name)
      else
        src.gsub(/thor_template/, @name.underscore)
      end

      folder = File.dirname(dest)
      FileUtils.mkdir_p(folder) unless File.exist?(folder)
      FileUtils.mv(src, dest) unless src == dest
    end

    def special_rename?(path)
      %w[
        thor_template.gemspec
        bin/thor_template
        lib/thor_template.rb
      ].include?(path)
    end

    def remove_empty_directories
      Dir['**/*'].
        select { |d| File.directory? d }.
        select { |d| (Dir.entries(d) - %w[ . .. ]).empty? }.
        each   { |d| Dir.rmdir d }
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
