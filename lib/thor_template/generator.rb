module ThorTemplate
  class Generator
    attr_reader :options
    def initialize(options={})
      @options = options
      @name = options[:name]
    end

    def run
      copy
      rename
      rewrite
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
          puts "already exists: #{dest}" unless options[:quiet]
        else
          puts "creating: #{dest}" unless options[:quiet]
          dirname = File.dirname(dest)
          FileUtils.mkdir_p(dirname) unless File.exist?(dirname)
          FileUtils.cp(src, dest)
        end
      end
    end

    def rename
      system("cd #{@name} && rake rename")
    end

    def rewrite
      template("Rakefile", "Rakefile")
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