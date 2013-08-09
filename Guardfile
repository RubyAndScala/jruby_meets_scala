require "guard-rspec-jruby"

guard "rspec-jruby", cli: '-t focus' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
  watch(%r{ext/target/scala-2.10/classes/.+\.class})  { "spec" }
end


guard 'bundler' do
  watch('Gemfile')
end
