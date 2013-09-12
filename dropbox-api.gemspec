# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dropbox-api/version"

Gem::Specification.new do |s|
  s.name        = "dropbox-api-petems"
  s.version     = Dropbox::API::VERSION
  s.authors     = ["Peter Souter"]
  s.email       = ["p.morsou@gmail.com"]
  s.homepage    = "http://github.com/petems/dropbox-api-petems"
  s.summary     = "A Ruby client for the DropBox REST API (Originally by marcinbunsch, forked by petems)"
  s.description = "To deliver a more Rubyesque experience when using the DropBox API (forked by petems)."

  s.rubyforge_project = "dropbox-api"

  s.add_dependency 'multi_json', '1.7.9'
  s.add_dependency 'oauth', '0.4.7'
  s.add_dependency 'hashie', '2.0.5'

  s.add_development_dependency 'rspec','2.14.1'
  s.add_development_dependency 'rake', '10.1.0'
  s.add_development_dependency 'simplecov', '0.7.1'
  s.add_development_dependency 'ruby-debug19', '0.11.6'
  s.add_development_dependency 'yajl-ruby', '1.1.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
