require 'rubygems'
require 'sinatra'
require 'sinatra/sequel'
require 'sequel'
require 'logger'
require 'haml'
require 'sass'


# 
# Home
#

get '/?' do
	@page_title = build_title "Home"
  haml :index
end

#
# Sessions
#

get '/sessions?' do
  @model = database[:sessions].all
	@page_title = build_title ["Sessions"]
  haml :'session/index'
end

get '/sessions?/:title' do
  @title = params[:title]
  @model = database[:sessions].filter(:title => @title)
  @page_title = build_title ["Session", @model[:title].to_s]
	haml :'session/detail' 
end

#
# Speakers
#

get '/speakers?' do
  @model = database[:speakers].all
  @page_title = build_title ["Speakers"]
  haml :'speaker/index'
end

get '/speakers?/:handle' do 
  @handle = params[:handle]
  @model = database[:speakers].filter(:handle => @handle)
  @page_title = build_title ["Speaker", @model['full_name'].to_s]
  haml :'speaker/detail'
end

get '/speakers?/edit/:handle' do
  puts "getting the edit form for #{params[:handle]}"
  @handle = params[:handle]
  @model = database[:speakers].filter(:handle => @handle) 
  @page_title = build_title [@model['full_name'].to_s]
  haml :'speaker/edit'
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
