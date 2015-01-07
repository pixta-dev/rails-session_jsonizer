$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "session_jsonizer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "session_jsonizer"
  s.version     = SessionJsonizer::VERSION
  s.authors     = ["Ryohei Ikegami"]
  s.email       = ["iofg2100@gmail.com"]
  s.homepage    = "https://github.com/pixta-dev/rails-session_jsonizer"
  s.summary     = "Serialize Rails 3 / 4 session as JSON"
  s.description = "session_jsonizer is a simple library for Rails 3 and 4 to
  serialize session as JSON in the same format."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 3.1.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
end
