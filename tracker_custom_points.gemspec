# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tracker_custom_points/version"

Gem::Specification.new do |s|
  s.name        = "tracker_custom_points"
  s.version     = TrackerCustomPoints::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jason Noble"]
  s.email       = ["perlwizard@gmail.com"]
  s.homepage    = "http://github.org/jasonnoble/tracker_custom_points"
  s.summary     = %q{Custom Point Values for Pivotal Tracker}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "pivotal-tracker"
end
