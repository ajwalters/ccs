require 'rake'
require 'sequel'

DB_NAME = "ccs.db"

task :environment

desc "start and run the application webserver."  
task :go do
	sh "cls & rackup -s thin -p 4567"
end

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
