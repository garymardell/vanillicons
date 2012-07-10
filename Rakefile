# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "vanillicons"
  gem.homepage = "http://github.com/garymardell/vanillicons"
  gem.license = "MIT"
  gem.summary = %Q{Generates the address for a vanillicon image}
  gem.description = %Q{Vanillicons are a small generated avatar made by vanillaforums.org, they use a md5 hash as the image key. Images can be generated on the site at vanillicon.com. The images come in 3 different sizes; 50px, 100px and 200px.}
  gem.email = "info@garymardell.co.uk"
  gem.authors = ["Gary Mardell"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "vanillicons #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
