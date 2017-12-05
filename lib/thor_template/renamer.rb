module ThorTemplate
  class Renamer
    def initialize(name)
      @name = name
    end

    def rename!
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
      dest = special_rename?(src) ?
        src.gsub(/thor_template/, @name) :
        src.gsub(/thor_template/, @name.underscore)

      folder = File.dirname(dest)
      FileUtils.mkdir_p(folder) unless File.exist?(folder)

      FileUtils.mv(src, dest) unless src == dest
    end

    # These paths should be rename with the actually named provied by the
    # user, the the underscored version.
    def special_rename?(path)
      %w[
        thor_template.gemspec
        exe/thor_template
        lib/thor_template.rb
      ].include?(path)
    end

    # Thanks https://stackoverflow.com/users/123094/db
    # https://stackoverflow.com/questions/1290670/ruby-how-do-i-recursively-find-and-remove-empty-directories
    def remove_empty_directories
      until empty_directories.empty?
        empty_directories.each { |d| Dir.rmdir(d) }
      end
    end

    def empty_directories
      Dir['**/*'].
        select { |d| File.directory? d }.
        select { |d| (Dir.entries(d) - %w[ . .. ]).empty? }.to_a
    end
  end
end
