require 'spec_helper'

# This spec tests the generator with various forms of project names:
#
#   hello, my_cli, my-cli, MyCLI
#
# The tests shell out and execute the new command to ensures a high level of
# confidence that the CLI generator works in real life.
#
# It also executes the generates specs of the new project to ensure specs
# also pass.
#
# Because it shells out tests take about 20 seconds to run this spec file.
describe CliTemplate::CLI do
  before(:each) do
    FileUtils.rm_rf("tmp")
    FileUtils.mkdir("tmp")
  end

  def create_new(name)
    execute("cd tmp && ../exe/cli-template new #{name}")
  end

  templates = %w[default colon_namespaces]
  templates.each do |template|
    ENV['TEMPLATE'] = template
    context("template #{template}") do
      describe "cli-template new" do
        context("simple single name") do
          it "should generate new" do
            out = create_new("hello")
            expect(out).to include("Creating new project called hello")
            expect(out).to include("You have successfully created a CLI project")
            out = execute("cd tmp/hello && rake")
            expect(out).to include("0 failures")
          end
        end

        context("underscored name") do
          it "should generate my_cli" do
            out = create_new("my_cli")
            expect(out).to include("Creating new project called my_cli")
            expect(out).to include("You have successfully created a CLI project")
            out = execute("cd tmp/my_cli && rake")
            expect(out).to include("0 failures")
          end
        end

        context("dasherized name") do
          it "should generate my-cli" do
            out = create_new("my-cli")
            expect(out).to include("Creating new project called my-cli")
            expect(out).to include("You have successfully created a CLI project")
            out = execute("cd tmp/my-cli && rake")
            expect(out).to include("0 failures")
          end
        end

        # CamelCase is ugly :(
        context("simple CamelCase name") do
          it "should generate MyCli" do
            out = create_new("MyCli")
            expect(out).to include("Creating new project called MyCli")
            expect(out).to include("You have successfully created a CLI project")
            out = execute("cd tmp/MyCli && rake")
            expect(out).to include("0 failures")
          end
        end
      end
    end
  end
end
