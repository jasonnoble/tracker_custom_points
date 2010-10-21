require 'rubygems'
require 'pivotal-tracker'
require 'yaml'

config = YAML.load(open(File.join(File.dirname(__FILE__), 'config.yml')))
mappings = YAML.load(open(File.join(File.dirname(__FILE__), 'mappings.yml')))

PivotalTracker::Client.token = config['token']

config['projects'].each do |project_id|
  project = PivotalTracker::Project.find(project_id)
  stories = project.stories.all(:current_state => ['finished', 'delivered', 'unscheduled', 'unstarted', 'started'])
  stories.each do |story|
    point_estimate = story.name[ /\(([\d\/]+)\)/, 1]
    if point_estimate && mappings[point_estimate] && story.estimate != mappings[point_estimate]
      puts "Updating story #{story.id} point estimate to #{mappings[point_estimate]}"
    	story.update(:estimate => mappings[point_estimate])
    end
  end
end
