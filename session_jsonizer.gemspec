$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "session_jsonizer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "session_jsonizer"
  s.version     = SessionJsonizer::VERSION
  s.authors     = ["Ryohei Ikegami"]
  s.email       = ["iofg2100@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of SessionJsonizer."
  s.description = "TODO: Description of SessionJsonizer."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 3.1.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
end
