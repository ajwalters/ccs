require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'sequel'

use Rack::Reloader
use Rack::CommonLogger
use Rack::ShowExceptions

DB_NAME = "ccs.db"
DB = Sequel.sqlite("#{DB_NAME}")

class Speaker < Sequel::Model  
end

class Session < Sequel::Model
end

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
  @model = DB[:sessions].all
	@page_title = build_title ["Sessions"]
  haml :'session/index'
end

get '/sessions?/:title' do
  @title = params[:title]
  @model = DB[:sessions].filter(:title => @title)
  @page_title = build_title ["Session", @model[:title].to_s]
	haml :'session/detail' 
end

#
# Speakers
#

get '/speakers?' do
  @model = DB[:speakers].all
  @page_title = build_title ["Speakers"]
  haml :'speaker/index'
end

get '/speakers?/:handle' do 
  @handle = params[:handle]
  @model = DB[:speakers].filter(:handle => @handle)
  @page_title = build_title ["Speaker", @model['full_name'].to_s]
  haml :'speaker/detail'
end

get '/speakers?/edit/:handle' do
  puts "getting the edit form for #{params[:handle]}"
  @handle = params[:handle]
  @model = DB[:speakers].filter(:handle => @handle) 
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
