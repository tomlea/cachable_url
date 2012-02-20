# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cachable_url/version"

Gem::Specification.new do |s|
  s.name        = "cachable_url"
  s.version     = CachableUrl::VERSION
  s.authors     = ["Tom Lea"]
  s.email       = ["commit@tomlea.co.uk"]
  s.homepage    = "http://tomlea.co.uk"
  s.summary     = %q{Hide query strings so caches can't see them.'}
  s.description = %q{Replace all '?'s in URLs with '%1F' (the ASCII unit separator char), and a middleware to undo it before your rack app sees.}

  s.rubyforge_project = "cachable_url"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
  s.add_development_dependency "rack-test"
end
