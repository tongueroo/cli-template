require 'spec_helper'

# to run specs with what's remembered from vcr
#   $ rake
# 
# to run specs with new fresh data from aws api calls
#   $ rake clean:vcr ; time rake
describe ThorTemplate do
  before(:all) do
    @args = "--noop"
  end

  describe "thor_template" do
    it "should create base" do
      out = execute("bin/thor_template base #{@args}")
      out.should include("Creating base thor_template!")
    end
  end
end

VCR.configure do |config|
  config.ignore_hosts 'codeclimate.com'
end