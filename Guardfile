guard 'rspec', :version => 2 do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})      { "spec/thor_template_spec.rb" }
  watch(%r{^lib/cfn/(.+)\.rb$})  { "spec/thor_template_spec.rb" }
  watch('spec/spec_helper.rb')   { "spec/thor_template_spec.rb" }
end

guard 'bundler' do
  watch('Gemfile')
  watch(/^.+\.gemspec/)
end
