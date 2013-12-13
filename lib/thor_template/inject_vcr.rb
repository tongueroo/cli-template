require 'thor'
require 'vcr'

# Purpose of this code is to inject vcr into any thor task that gets called.
# Doing this so we can use vcr to test cli commands.

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :fakeweb
end 

# Fixes a missing attributes in Fakeweb's stubbed HTTP client
class FakeWeb::StubSocket; 
  attr_accessor :read_timeout
  attr_accessor :continue_timeout
end

class Thor
  class << self
    def dispatch_with_vcr(meth, given_args, given_opts, config) #:nodoc:
      cassette = given_args.join('_')
      VCR.use_cassette(cassette, :serialize_with => :json) do
        dispatch_without_vcr(meth, given_args, given_opts, config) #:nodoc:
      end
    end
    alias_method :dispatch_without_vcr, :dispatch
    alias_method :dispatch, :dispatch_with_vcr
  end
end