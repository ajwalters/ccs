require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
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
  haml :slo
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
  puts "getting the edit form for #{params[:handle]}"
  @handle = params[:handle]
  @model = DB['speaker'].find_one({:handle => @handle})
  haml :'speaker/edit'
end

get '/css/application.css' do
  header 'Content-Type' => 'text/css; charset=utf8'
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
end


