$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'rails_admin_rollincode/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'rails_admin_rollincode'
  s.version     = RailsAdminRollincode::VERSION
  s.authors     = ['KOVACS Nicolas', 'VIDEAUD Matthieu']
  s.email       = ['pro.nicovak@gmail.com']
  s.homepage    = 'https://github.com/rollincode/rails_admin_theme'
  s.summary     = 'Rails_Admin FLAT theme overhaul'
  s.description = 'Rails_Admin FLAT theme overhaul'
  s.license     = 'MIT'

  s.files = Dir['{lib,vendor}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.add_dependency 'rails', ['>= 4.0', '< 6']
end
