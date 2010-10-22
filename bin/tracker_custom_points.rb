require 'rubygems'
require 'pivotal-tracker'
require 'yaml'

if File.exists?(File.join(ENV['HOME'], '.tracker_custom_points_config.yml'))
  config = YAML.load(open(File.join(ENV['HOME'], '.tracker_custom_points_config.yml')))
else
  puts "You do not have your tracker_custom_points_config.yml file setup"
  puts "\tcp #{File.join(File.dirname(__FILE__), '../config/config.yml.example')} ~/.tracker_custom_points_config.yml"
  exit
end

if File.exists?(File.join(ENV['HOME'], '.tracker_custom_points_mappings.yml'))
  mappings = YAML.load(open(File.join(ENV['HOME'], '.tracker_custom_points_mappings.yml')))
else
  mappings = YAML.load(open(File.join(File.dirname(__FILE__), '../config/mappings.yml')))
end

PivotalTracker::Client.token = config['token']

config['projects'].each do |project_id|
  project = PivotalTracker::Project.find(project_id)
  stories = project.stories.all(:current_state => ['finished', 'delivered', 'unscheduled', 'unstarted', 'started'])
  stories.each do |story|
    point_estimate = story.name[ /\(([\d\/]+)\)/, 1]
    if point_estimate && mappings[point_estimate] && story.estimate != mappings[point_estimate]
      print "Updating story #{story.id} point estimate to #{mappings[point_estimate]}..."
      begin
        story.update(:estimate => mappings[point_estimate])
      rescue RestClient::RequestFailed
        print "Update failed"
      ensure
        puts ""
      end
    end
  end
end
