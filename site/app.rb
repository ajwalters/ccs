require 'rubygems'
require 'sinatra'
require 'sinatra/sequel'
require 'sequel'
require 'logger'
require 'haml'
require 'sass'

#ROUTES = [
#  (r'/resources/new', New),
#  (r'/resources/(\w+?)/(show|edit|delete)', Show),
#  (r'/resources/(\w+?)', UpdateOrDestroy),
#  (r'/resources', IndexOrCreate),
#  (r'/(.*)', DefaultHandler),
#  ]

# 
# Home
#

get '/?' do
	@title = build_title "Home"
  haml :index
end

#
# Sessions
#

get '/sessions?' do
  @sessions = Session.all
  @title = build_title ["Sessions"]
  haml :'session/index'
end

get '/sessions?/:title' do
  show_session params[:title].to_s
end

get '/sessions?/:title/show' do
  show_session params[:title].to_s
end

def show_session(title)
  @session = Session.filter(:title => title).first
  @title = build_title ["Session", title]
	haml :'session/detail'
end

get '/sessions?/:title/edit' do
  @session = Session.filter(:title => params[:title].to_s).first
  @title = build_title ["Session", params[:title].to_s, "Edit"]
end
  
get '/sessions?/:title/delete' do
  @session = Session.filter(:title => params[:title].to_s).first
  @title = build_title ["Session", params[:title].to_s, "Delete"]
  
end
#
# Speakers
#

get '/speakers?' do
  @speakers = Speaker.all
  @title = build_title(["Speakers"])
  haml :'speaker/index'
end

get '/speakers?/:handle' do 
  @speaker = Speaker.filter(:handle => params[:handle].to_s).first
  @title = build_title ["Speaker", @speaker.full_name]
  haml :'speaker/detail'
end

get '/speakers?/edit/:handle' do
  @speaker = Speaker.filter(:handle => params[:handle].to_s)
  @title = build_title [@speaker.full_name]
  haml :'speaker/edit'
end

post '/speakers?/:handle' do
  puts "posted to speakers"
end



#
# Misc
#

get '/css/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :style
end

get '/favicon.ico' do
  puts ' --- favicon.ico --- '
end

helpers do
  def protected! 
    #unless authorized?  response['WWW-Authenticate'] = %(Basic realm="Testing HTTP Auth") throw(:halt, [401, "Not authorized\n"])
    #end
    true
  end

  def authorized?
    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == ['admin', 'secret']
  end
  
  def build_title(names)
    ["Chicago Code Camp", names].flatten.join ' => '
  end    
end

#
# Migrations
#

set :database, 'sqlite://ccs.db'

puts "The speakers table doesn't exist." if !database.table_exists?("speakers")
puts "The sessions table doesn't exist." if !database.table_exists?("sessions")

migration "create sessions table" do
  database.create_table :sessions do
    primary_key :id
    String :title, :null => false
    String :description
  end
end

migration "create speakers table" do
  database.create_table :speakers do
    primary_key :id
    String :handle, :null => false
    String :full_name, :null => false
    String :biography
  end
end

#
# Models
#

class Speaker < Sequel::Model  
end

class Session < Sequel::Model
end

#
# Configuration
#

use Rack::Reloader
use Rack::CommonLogger
use Rack::ShowExceptions

configure :development do
  s = Session.create(:title => "Alt.NET", :description => "Learn everything about the Alt.NET and the community surrounding the movement.")
  s = Session.create(:title => "All.NET")
  s = Session.create(:title => "Not.NET")
  puts "Added #{Session.count()} session(s)."
  
  s = Speaker.create(:handle => "spereira", :full_name => "Sergio Pereira", :biography => "Sergio is an avid JavaScripter and runs the Chicago Alt.NET developer group.")
  s = Speaker.create(:handle => "sseely", :full_name => "Scott Seely", :biography => "Scott is a frequent speaker and author on all things .NET. He also runs the LCNUG in Grayslake, IL.")
  s = Speaker.create(:handle => "just3ws", :full_name => "Michael D. Hall")
  puts "Added #{Speaker.count()} speaker(s)."
end
