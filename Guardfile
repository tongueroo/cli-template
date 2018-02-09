guard 'rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})      { "spec/cli-template_spec.rb" }
  watch(%r{^lib/cli-template/(.+)\.rb$})  { "spec/cli-template_spec.rb" }
  watch('spec/spec_helper.rb')   { "spec/cli-template_spec.rb" }
end

guard 'bundler' do
  watch('Gemfile')
  watch(/^.+\.gemspec/)
end
