require 'spec_helper'

# to run specs with what's remembered from vcr
#   $ rake
#
# to run specs with new fresh data from aws api calls
#   $ rake clean:vcr ; time rake
describe ThorTemplate::Generator do
  before(:each) do
    options = {
      cwd: "tmp",
      name: "hello"
    }
    @generator = ThorTemplate::Generator.new(options)
  end

  it "should generate" do
    @generator.run
    expect(File.exist?("hello")).to be_truthy
    expect(File.exist?("hello/hello.gemspec")).to be_truthy
  end
end
