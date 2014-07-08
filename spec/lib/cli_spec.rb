require 'spec_helper'

# to run specs with what's remembered from vcr
#   $ rake
# 
# to run specs with new fresh data from aws api calls
#   $ rake clean:vcr ; time rake
describe ThorTemplate::CLI do
  before(:all) do
    @args = "--noop"
  end

  describe "new" do
    it "should generate" do
      out = execute("cd tmp && ../bin/thor_template new hello #{@args}")
      expect(out).to include("Created hello project!")
    end
  end
end

VCR.configure do |config|
  config.ignore_hosts 'codeclimate.com'
end