$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "datajam/myplugin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "datajam-myplugin"
  s.version     = Datajam::Myplugin::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Myplugin."
  s.description = "TODO: Description of Myplugin."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  # s.add_dependency "rails", "~> 3.1.6"

  s.add_development_dependency 'fuubar'
end
