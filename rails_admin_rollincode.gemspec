$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_rollincode/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_rollincode"
  s.version     = RailsAdminRollincode::VERSION
  s.authors     = ["KOVACS Nicolas"]
  s.email       = ["perso.nkovacs@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RailsAdminRollincode."
  s.description = "TODO: Description of RailsAdminRollincode."
  s.license     = "MIT"

  s.files = Dir["{lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.5"
end
