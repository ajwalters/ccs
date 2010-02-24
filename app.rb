require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'

#use Rack::Auth::Basic do |username, password|
#  [username, password] == ['admin', 'secret']
#end

use Rack::Reloader

EVENT = {:name => "Chicago Code Camp 2"}

SPEAKERS = [{:full_name=>"Sergio Pereira", :handle=>"spereira", :biography => "Sergio is an avid JavaScripter and runs the Chicago Alt.NET developer group."},
            {:full_name=>"Scott Seely", :handle=>"sseely", :biography => "Scott is a frequent speaker and author on all things .NET. He also runs the LCNUG in Grayslake, IL."},
            {:full_name=>"Michael D. Hall", :handle=>"just3ws"},]

SESSIONS = [{:title=>"Alt.NET", :description => "Learn everything about the Alt.NET and the community surrounding the movement."},
            {:title=>"All.NET"},
            {:title=>"Not.NET"},]

SLOTS = ["9-9:45",
         "10-10:45",
         "11-11:45",]

AGENDA = [{:slots => [SLOTS[0]], 
           :session => SESSIONS.select{|s| s[:title]=="Not.NET"},
           :speakers => [SPEAKERS.select{|s| s[:handle]=="just3ws"}]},

          {:slots => [SLOTS[1]],
           :session => SESSIONS.select{|s| s[:title]=="Alt.NET"},
           :speakers => [SPEAKERS.select{|s| s[:handle]=="spereira"}]},

          {:slots => [SLOTS[2]],
           :session => SESSIONS.select{|s| s[:title]=="All.NET"},
           :speakers => [SPEAKERS.select{|s| s[:handle]=="sseely"}]},]

get '/?' do
  haml :index
end

get '/sessions?' do
  @model = SESSIONS
  haml :sessions
end

get '/sessions?/:title' do
  @title = params[:title]
  @model = SESSIONS.select{|s| s[:title] == @title }.first
  haml :session
end

get '/slots?' do
  @model = SLOTS
  haml :slots
end

get '/slots?/:slot' do
  @model = param[:slot]
  haml :slot
end

get '/speakers?' do
  @model = SPEAKERS
  haml :speakers
end

get '/speakers?/:handle' do
  @handle = params[:handle]
  @model = SPEAKERS.select{|s| s[:handle] == @handle }.first
  haml :speaker
end

# administration section
get '/admin' do
  protected!
  "you must be an admin!"
end

# style assets
get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
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
end
