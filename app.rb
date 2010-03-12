begin
  # Require the preresolved locked set of gems.
  require ::File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  # Fallback on doing the resolve at runtime.
  require "rubygems"
  require "bundler"
  Bundler.setup
end

require 'sinatra'
require 'sinatra/sequel'
require 'sequel'
require 'haml'
require 'sass'
require 'rack'

configure :development do
  use Rack::Reloader
end

set :database, ENV['DATABASE_URL'] || 'sqlite://ccs.db'

puts "the submissions table doesn't exist."
migration "create the submissions table" do
  database.create_table :submissions do
    primary_key :id
    text :full_name
    text :title
    text :description
    text :email
    text :homepage
    text :biography
    timestamp :created_at
    timestamp :updated_at
  end
end

class Submission < Sequel::Model
end

# 
# Home
#

get '/?' do
  haml :index
end

post '/submit/?' do
  begin
    Submission.insert(:full_name => params[:full_name].to_s,
                      :title => params[:title].to_s,
                      :description => params[:description].to_s,
                      :email => params[:email].to_s,
                      :homepage => params[:homepage].to_s,
                      :biography => params[:biography].to_s,
                      :created_at => Time.now,
                      :updated_at => Time.now)
    
    haml :speaker_submission_result
  rescue
    "<html><head><title>Chicago Code Camp - Error</title></head><body>Whoops! We had a slight error.</body></html>"  
  end
  
end


#
# Misc
#

get '/css/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :style
end