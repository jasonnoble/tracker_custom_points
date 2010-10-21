# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tracker_custom_points}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jason Noble"]
  s.autorequire = %q{tracker_custom_points}
  s.date = %q{2010-10-21}
  s.default_executable = %q{tracker-custom-points.rb}
  s.description = %q{Custom Point Values for Pivotal Tracker}
  s.email = %q{perlwizard@gmail.com}
  s.executables = ["tracker-custom-points.rb"]
  s.files = ["LICENSE", "README.rdoc", "Rakefile", "bin/tracker_custom_points.rb", "config/config.yml", "config/config.yml.example", "config/mappings.yml", "bin/tracker-custom-points.rb"]
  s.homepage = %q{http://github.com/jasonnoble/tracker_custom_points}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Custom Point Values for Pivotal Tracker}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<pivotal-tracker>, [">= 0"])
      s.add_runtime_dependency(%q<yaml>, [">= 0"])
    else
      s.add_dependency(%q<pivotal-tracker>, [">= 0"])
      s.add_dependency(%q<yaml>, [">= 0"])
    end
  else
    s.add_dependency(%q<pivotal-tracker>, [">= 0"])
    s.add_dependency(%q<yaml>, [">= 0"])
  end
end
