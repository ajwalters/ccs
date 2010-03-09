require 'rubygems'
require 'rake'
require 'sequel'

DB_NAME = "ccs.db"

namespace :db do
	desc "initialize the database."
	task :init do
		db = Sequel.sqlite DB_NAME
	end

	desc "drop and re-initialize the database"
	task :reset => [:drop, :init]
 
	desc "drop the database"
	task :drop do
    begin
      rm DB_NAME
    rescue
      puts "couldn't find #{DB_NAME}, oh well"
    end
	end
end

task :environment do
end

desc "start and run the application webserver."  
task :go do
	sh "cls & ruby site/app.rb -s webrick"
end

#def initialize_database
#	puts "Initializing \"#{DB_NAME}\"."

#	@event = {:name => "Chicago Code Camp 2"}

#	@slots = [{:time => "9-9:45"},
#		{:time => "10-10:45"},
#		{:time => "11-11:45"},
#		{:time => "1:00-1:45"}]

#	@agenda = [{:slots => [@slots[0]],
#			:session => @sessions.select{|s| s[:title] == "Not.NET"},
#			:speakers => [@speakers.select{|s| s[:handle] == "just3ws"}]},

#		{:slots => [@slots[1]],
#			:session => @sessions.select{|s| s[:title] == "Alt.NET"},
#			:speakers => [@speakers.select{|s| s[:handle] == "spereira"}]},


#		{:slots => [@slots[2], @slots[3]],
#			:session => @sessions.select{|s| s[:title] == "All.NET"},
#			:speakers => [@speakers.select{|s| s[:handle] == "sseely"}]},]
						
#  initialize_sequel_db  
#end


