require 'spec_helper'

# to run specs with what's remembered from vcr
#   $ rake
# 
# to run specs with new fresh data from aws api calls
#   $ rake clean:vcr ; time rake
describe ThorTemplate::Generator do
  before(:each) do
    FileUtils.rm_rf("tmp/hello")
    options = {
      name: "tmp/hello"
    }
    @generator = ThorTemplate::Generator.new(options)
  end

  it "should generate" do
    @generator.run
    File.exist?("tmp/hello").should be_true
    File.exist?("tmp/hello/hello.gemspec").should be_true
  end
end
