Gem::Specification.new do |s|
  s.name        = "bosdk_designer"
  s.version     = "0.2.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Shane Emmons"]
  s.email       = "semmons99@gmail.com"
  s.homepage    = "http://semmons99.github.com/bosdk-designer"
  s.summary     = "Access the Business Objects Universe Designer using Ruby"
  s.description = "This library gives you access to the Business Objects Universe Designer through the Ruby WIN32 API."

  s.required_rubygems_version = ">= 1.3.6"

  s.add_development_dependency "rspec", ">= 2.0.0"

  s.files =  Dir.glob("{lib,spec}/**/*")
  s.files += %w(README.md LICENSE)
  s.files += %w(Rakefile .gemtest bosdk_designer.gemspec)

  s.require_path = "lib"
end

