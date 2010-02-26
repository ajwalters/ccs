require 'rubygems'
require 'sinatra'
require 'haml'
require 'mongo'

use Rack::Reloader

DB_NAME = "ccs"
DB = Mongo::Connection.new.db(DB_NAME)

get '/?' do
  haml :index
end

get '/sessions?' do
  @model = DB['session'].find()
  haml :'session/index'
end

post '/sessions?/:title' do
end

get '/sessions?/:title' do
  @title = params[:title]
  @model = DB['session'].find_one({:title => @title}) #.select{|s| s[:title] == @title }.first
  haml :'session/detail'
end

get '/slots?' do
  @model = DB['slot'].find()
  haml :slots
end

get '/slots?/:time' do
  @time = params[:time]
  @model = DB['slot'].find_one({:time => @time})
  haml :slot
end

get '/speakers?' do
  @model = DB['speaker'].find()
  haml :'speaker/index'
end

get '/speakers?/:handle' do
  @handle = params[:handle]
  @model = DB['speaker'].find_one({:handle => @handle})
  haml :'speaker/detail'
end

get '/speakers?/edit/:handle' do
  @handle = params[:handle]
  @model = DB['speaker'].find_one({:handle => @handle})
  haml :'speaker/edit'
end

post '/speakers?/:handle' do
  puts params[:handle]
  puts params[:full_name]
  puts params[:biography]
end

# administration section
get '/admin' do
  protected!
  "you must be an admin!"
end

get '/admin/db/:action' do
  protected!
  @action = params[:action]
  if @action == "initialize"
    initialize_database
  elsif @action == "drop"
    drop_database
  end
end

helpers do
  def protected!
    unless authorized?
      response['WWW-Authenticate'] = %(Basic realm="Testing HTTP Auth")
      throw(:halt, [401, "Not authorized\n"])
    end
  end

  def authorized?
    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == ['admin', 'secret']
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


    DB['event'].insert(event)
    puts "Added #{DB['event'].count()} event(s)."

    speakers.each {|i| DB['speaker'].insert(i) }
    puts "Added #{DB['speaker'].count()} speaker(s)."

    sessions.each {|i| DB['session'].insert(i) }
    puts "Added #{DB['session'].count()} session(s)."

    slots.each {|i| DB['slot'].insert(i) }
    puts "Added #{DB['slot'].count()} slot(s)."

    agenda.each {|i| DB['agenda'].insert(i) }
    puts "Added #{DB['agenda'].count()} agenda(s)."

    puts "Initialized \"#{DB_NAME}\"."
  end

  def drop_database
    m = Mongo::Connection.new
    m.drop_database(DB_NAME)
    "Dropped database \"#{DB_NAME}\"."
  end
end