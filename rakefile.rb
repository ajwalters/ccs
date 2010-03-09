require 'rubygems'
require 'rake'
require 'sequel'

DB_NAME = "ccs"

def initialize_sequel_db
  db = Sequel.sqlite('ccs.db')
  
  db.create_table :speakers do
    primary_key :id
    String :handle
    String :full_name
    String :biography
  end
  
  speakers = db[:speakers]
  @speakers.each {|i| speakers.insert(:handle => i[:handle], :full_name => i[:full_name], :biography => i[:biography])  }
  puts "Added #{db[:speakers].count()} speaker(s)."
  
  db.create_table :sessions do
    primary_key :id
    String :title
    String :description
  end
  sessions = db[:sessions]
  @sessions.each {|i| sessions.insert(:title => i[:title], :description => i[:description])}
  puts "Added #{db[:sessions].count()} session(s)."
end

namespace :db do
	desc "initialize the database."
	task :init do
		initialize_database
	end

	desc "drop and re-initialize the database"
	task :reset => [:drop, :init]
 
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

	@event = {:name => "Chicago Code Camp 2"}

	@speakers = [{:full_name => "Sergio Pereira", :handle => "spereira", :biography => "Sergio is an avid JavaScripter and runs the Chicago Alt.NET developer group."},
		{:full_name => "Scott Seely", :handle => "sseely", :biography => "Scott is a frequent speaker and author on all things .NET. He also runs the LCNUG in Grayslake, IL."},
		{:full_name => "Michael D. Hall", :handle => "just3ws"},]

	@sessions = [{:title => "Alt.NET", :description => "Learn everything about the Alt.NET and the community surrounding the movement."},
		{:title => "All.NET"},
		{:title => "Not.NET"},]

	@slots = [{:time => "9-9:45"},
		{:time => "10-10:45"},
		{:time => "11-11:45"},
		{:time => "1:00-1:45"}]

	@agenda = [{:slots => [@slots[0]],
			:session => @sessions.select{|s| s[:title] == "Not.NET"},
			:speakers => [@speakers.select{|s| s[:handle] == "just3ws"}]},

		{:slots => [@slots[1]],
			:session => @sessions.select{|s| s[:title] == "Alt.NET"},
			:speakers => [@speakers.select{|s| s[:handle] == "spereira"}]},


		{:slots => [@slots[2], @slots[3]],
			:session => @sessions.select{|s| s[:title] == "All.NET"},
			:speakers => [@speakers.select{|s| s[:handle] == "sseely"}]},]
						
  initialize_sequel_db  
end


def drop_database
  begin
    rm "ccs.db"
  rescue
    puts "couldn't find ccs.db, oh well"
  end
end
