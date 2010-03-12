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
require 'pony'

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
  
  message = ""
  
  begin
    message += "{"
    params.each {|k,v| message += ":#{k} => '#{v}',"}
    message += '}'
  rescue
    puts "error loading message; message currently holds '#{message}'"
  end    
  
  begin
    Pony.mail(:via => :smtp,
              :to => "ccc2@just3ws.com",
              :from => "submissions@chicagocodecamp.com",
              :subject => "New Speaker Submission.",
              :body => message,
              :smtp => {:host => "smtp.sendgrid.net",
                        :port => "25",
                        :auth => :plain,
                        :user => ENV['SENDGRID_USERNAME'],
                        :password => ENV['SENDGRID_PASSWORD'],
                        :domain => ENV['SENDGRID_DOMAIN'],})
  rescue
    puts "error sending email; message currently holds '#{message}'"
  end
  
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
    puts "error inserting record; message currently holds '#{message}'"
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