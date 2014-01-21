require File.expand_path('../lib/active_admin/gallery/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "activeadmin-gallery"
  gem.version       = ActiveAdmin::Gallery::VERSION
  gem.summary       = %q{Simplified images and galleries creation for ActiveAdmin}
  gem.description   = %q{With activeadmin-gallery, you are able to DRY up your models and freely associate images and galleries to your models.}
  gem.license       = "MIT"
  gem.authors       = ["Stefano Verna"]
  gem.email         = "s.verna@cantierecreativo.net"
  gem.homepage      = "https://github.com/stefanoverna/activeadmin-gallery#readme"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'activeadmin', '~> 0.6.2'
  gem.add_runtime_dependency 'activeadmin-dragonfly'
  gem.add_runtime_dependency 'activeadmin-extra'
  gem.add_dependency 'jquery-ui-rails'

  gem.add_development_dependency 'bundler', '~> 1.0'
end
