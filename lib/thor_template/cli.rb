require 'thor'

module ThorTemplate
  class CLI < Thor
    desc 'foo', 'foo'
    long_desc 'foo'
    def foo
      puts "foo"
    end
  end
end
