require 'spec_helper'

# to run specs with what's remembered from vcr
#   $ rake
#
# to run specs with new fresh data from aws api calls
#   $ rake clean:vcr ; time rake
describe CliTemplate::CLI do
  before(:all) do
    @args = "--noop"
  end

  describe "new" do
    context("simple single name") do
      it "should generate" do
        out = execute("cd tmp && ../exe/cli-template new hello #{@args}")
        expect(out).to include("Creating new project called hello")
        expect(out).to include("You have successfully created a CLI project")
        out = execute("cd tmp/hello && rake")
        expect(out).to include("0 failures")
      end
    end

    context("underscored name") do
      it "should generate" do
        out = execute("cd tmp && ../exe/cli-template new my_cli #{@args}")
        expect(out).to include("Creating new project called my_cli")
        expect(out).to include("You have successfully created a CLI project")
        out = execute("cd tmp/my_cli && rake")
        expect(out).to include("0 failures")
      end
    end

    context("dasherized name") do
      it "should generate" do
        out = execute("cd tmp && ../exe/cli-template new my-cli #{@args}")
        expect(out).to include("Creating new project called my-cli")
        expect(out).to include("You have successfully created a CLI project")
        out = execute("cd tmp/my-cli && rake")
        expect(out).to include("0 failures")
      end
    end

    # CamelCase is ugly :(
    context("simple CamelCase name") do
      it "should generate" do
        out = execute("cd tmp && ../exe/cli-template new MyCli #{@args}")
        expect(out).to include("Creating new project called MyCli")
        expect(out).to include("You have successfully created a CLI project")
        out = execute("cd tmp/MyCli && rake")
        expect(out).to include("0 failures")
      end
    end
  end
end
