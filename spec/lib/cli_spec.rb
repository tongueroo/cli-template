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
        expect(out).to include("Created hello project!")
        out = execute("cd tmp/hello && rake")
        expect(out).to include("0 failures")
      end
    end

    context("underscored name") do
      it "should generate" do
        out = execute("cd tmp && ../exe/cli-template new my_cli #{@args}")
        expect(out).to include("Created my_cli project!")
        out = execute("cd tmp/my_cli && rake")
        expect(out).to include("0 failures")
      end
    end

    context("dasherized name") do
      it "should generate" do
        out = execute("cd tmp && ../exe/cli-template new my-cli #{@args}")
        expect(out).to include("Created my-cli project!")
        out = execute("cd tmp/my-cli && rake")
        expect(out).to include("0 failures")
      end
    end

    # CamelCase is ugly :(
    context("simple CamelCase name") do
      it "should generate" do
        out = execute("cd tmp && ../exe/cli-template new MyCli #{@args}")
        expect(out).to include("Created MyCli project!")
        out = execute("cd tmp/MyCli && rake")
        expect(out).to include("0 failures")
      end
    end
  end
end

VCR.configure do |config|
  config.ignore_hosts 'codeclimate.com'
end
