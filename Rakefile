require 'rubygems'
require 'rake'
require 'rake/clean'

CLOBBER.include 'pkg'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "bosdk_designer"
    gem.summary = %Q{Access the Business Objects Universe Designer using Ruby}
    gem.description = %Q{This library gives you access to the Business Objects Universe Designer through the Ruby WIN32 API.}
    gem.email = "semmons99@gmail.com"
    gem.homepage = "http://semmons99.github.com/bosdk_designer"
    gem.authors = ["Shane Emmons"]
    gem.rubyforge_project = "bosdk-designer"
    gem.add_development_dependency "rspec", "~> 1.3.0"
  end
  Jeweler::GemcutterTasks.new
  Jeweler::RubyforgeTasks.new do |rubyforge|
    rubyforge.doc_task = "rdoc"
    rubyforge.remote_doc_path = ""
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "bosdk_designer #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
