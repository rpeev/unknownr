require 'rake/testtask'

require_relative 'lib/windows_com'

Rake::TestTask.new do |t|
  t.test_files = FileList[
    'test/*_test.rb'
  ]
end

desc 'Build gem'
task :build => [:test] do |t|
  system "gem build windows_com.gemspec"
end

desc 'Push gem'
task :push => [:build] do |t|
  system "gem push windows_com-#{WINDOWS_COM_VERSION}.gem"
end

task :default => [:test]

if __FILE__ == $0
  Rake::Task[:default].invoke
end
