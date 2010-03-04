require 'rubygems'
require 'rake'
require 'mongo'

DB_NAME = "ccs"

namespace :db do
	desc "Migrate the database."
	task(:migrate => :environment) do
		ActiveRecord::Base.logger = Logger.new(STDOUT)
		ActiveRecord::Migration.verbose = true
		ActiveRecord::Migrator.migrate("db/migrate")
	end

	desc "initialize the database."
	task :init do
		initialize_database
	end

	desc "drop and re-initialize the database"
	task :reinit => [:drop, :init]

	desc "drop the database"
	task :drop do
		drop_database
	end
end

task :environment do
	puts "configure environment"
end


desc "start and run the application webserver."  
task :go do
	sh "cls & ruby site/app.rb -s webrick"
end

def initialize_database
	puts "Initializing \"#{DB_NAME}\"."

	event = {:name => "Chicago Code Camp 2"}

	speakers = [{:full_name=>"Sergio Pereira", :handle=>"spereira", :biography => "Sergio is an avid JavaScripter and runs the Chicago Alt.NET developer group."},
		{:full_name=>"Scott Seely", :handle=>"sseely", :biography => "Scott is a frequent speaker and author on all things .NET. He also runs the LCNUG in Grayslake, IL."},
		{:full_name=>"Michael D. Hall", :handle=>"just3ws"},]

	sessions = [{:title=>"Alt.NET", :description => "Learn everything about the Alt.NET and the community surrounding the movement."},
		{:title=>"All.NET"},
		{:title=>"Not.NET"},]

	slots = [{:time=>"9-9:45"},
		{:time=>"10-10:45"},
		{:time=>"11-11:45"},
		{:time=>"1:00-1:45"}]

	agenda = [{:slots => [slots[0]],
			:session => sessions.select{|s| s[:title]=="Not.NET"},
			:speakers => [speakers.select{|s| s[:handle]=="just3ws"}]},

		{:slots => [slots[1]],
			:session => sessions.select{|s| s[:title]=="Alt.NET"},
			:speakers => [speakers.select{|s| s[:handle]=="spereira"}]},


		{:slots => [slots[2], slots[3]],
			:session => sessions.select{|s| s[:title]=="All.NET"},
			:speakers => [speakers.select{|s| s[:handle]=="sseely"}]},]

  db = Mongo::Connection.new.db(DB_NAME)
	db['event'].insert(event)
	puts "Added #{db['event'].count()} event(s)."

	speakers.each {|i| db['speaker'].insert(i) }
	puts "Added #{db['speaker'].count()} speaker(s)."

	sessions.each {|i| db['session'].insert(i) }
	puts "Added #{db['session'].count()} session(s)."

	slots.each {|i| db['slot'].insert(i) }
	puts "Added #{db['slot'].count()} slot(s)."

	agenda.each {|i| db['agenda'].insert(i) }
	puts "Added #{db['agenda'].count()} agenda(s)."

	message = "Initialized \"#{DB_NAME}\"."
	puts message
	message
end

def drop_database
	m = Mongo::Connection.new
	m.drop_database(DB_NAME)
	message = "Dropped database \"#{DB_NAME}\"."
	puts message
	message
end
