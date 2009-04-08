require 'rubygems'
require 'rake'

# %w[rubygems rake rake/clean fileutils newgem rubigen].each { |f| require f }
# require File.dirname(__FILE__) + '/lib/butterfly'


begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "butterfly"
    gem.summary = %Q{An HTTP mini server to query against modular adaptors}
    gem.email = "arilerner@mac.com"
    gem.homepage = "http://github.com/auser/butterfly"
    gem.files =  FileList["[A-Z]*", "{bin,examples,lib,test}/**/*", '.gitignore']
    gem.post_install_message = 'PostInstall.txt'
    gem.add_dependency 'rack', '>=0.9'
    gem.add_dependency 'json', '>=1.1.3'
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = false
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end


task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML.load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "butterfly #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

