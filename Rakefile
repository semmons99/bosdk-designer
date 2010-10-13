require 'rubygems'
require 'rake'
require 'rake/clean'

CLOBBER.include 'pkg'
CLOBBER.include 'doc'
CLOBBER.include '.yardoc'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "bosdk_designer"
    gem.summary = %Q{Access the Business Objects Universe Designer using Ruby}
    gem.description = %Q{This library gives you access to the Business Objects Universe Designer through the Ruby WIN32 API.}
    gem.email = "semmons99@gmail.com"
    gem.homepage = "http://semmons99.github.com/bosdk-designer"
    gem.authors = ["Shane Emmons"]
    gem.rubyforge_project = "bosdk-designer"
    gem.add_development_dependency "rspec", "~> 2.0.0"
  end
  Jeweler::GemcutterTasks.new
  Jeweler::RubyforgeTasks.new do |rubyforge|
    rubyforge.doc_task = "rdoc"
    rubyforge.remote_doc_path = ""
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new
