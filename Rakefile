require 'rubygems'
require 'rake/gempackagetask'
require 'rubygems/specification'
require 'rake'

GEM='tracker_custom_points'

spec = Gem::Specification.new do |gem|
  gem.name = GEM
  gem.version = "0.0.1"
  gem.summary = %Q{Custom Point Values for Pivotal Tracker}
  gem.description = %Q{Custom Point Values for Pivotal Tracker}
  gem.email = "perlwizard@gmail.com"
  gem.homepage = "http://github.com/jasonnoble/#{GEM}"
  gem.authors = ["Jason Noble"]
  gem.add_dependency(["pivotal-tracker"])
  gem.add_dependency(["yaml"])
  gem.autorequire = GEM
  gem.executables = ['tracker-custom-points.rb']
  gem.files = %w(LICENSE README.rdoc Rakefile) + Dir.glob("{bin,config}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "install the gem locally"
task :install => [:package] do
  sh %{sudo gem install pkg/#{GEM}-#{GEM_VERSION}}
end

desc "create a gemspec file"
task :make_spec do
  File.open("#{GEM}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

namespace :gem do
  desc "validate the gem like github does"
  task :validate do
    require 'rubygems/specification'
    data = File.read("#{GEM}.gemspec")
    spec = nil

    if data !~ %r{!ruby/object:Gem::Specification}
      Thread.new { spec = eval("$SAFE = 3\n#{data}") }.join
    else
      spec = YAML.load(data)
    end

    puts spec
    puts spec.validate ? "OK" : "FAIL"
  end
end

