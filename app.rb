# Pony 0.6 is required due to incompatibilities on Heroku/Sendgrid
gem 'pony', '0.6'

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
require 'logger'
require 'pony'

configure :development do
#  LOGGER = Logger.new("logs\sinatra.log")
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
    puts "error loading message; message currently holds '#{message}'; Error #{$!}"
  end    

  
    submission = Submission.new
    submission.full_name = params[:full_name].to_s
    submission.title = params[:title].to_s
    submission.description = params[:description].to_s
    submission.email = params[:email].to_s
    submission.homepage = params[:homepage].to_s
    submission.biography = params[:biography].to_s
    submission.created_at = Time.now
    submission.updated_at = Time.now

    @model = submission
  
  begin
    Pony.mail(:via => :smtp,
              :to => 'ccc2@just3ws.com',
              :from => 'submissions@chicagocodecamp.com',
              :subject => 'New Speaker Submission.',
              :body => haml :speaker_submission_result, 
              :smtp => {:host => 'smtp.sendgrid.net',
                        :auth => 'plain',
                        :user => ENV['SENDGRID_USERNAME'],
                        :password => ENV['SENDGRID_PASSWORD'],
                        :domain => ENV['SENDGRID_DOMAIN'],})
  rescue
    puts "Error sending email; message currently holds '#{message}'; Error #{$!}"
  end
  
  begin
    submission.save

    haml :speaker_submission_result
  rescue
    puts "error inserting record; message currently holds '#{message}'; Error #{$!}"
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

helpers do
#  def logger
#    LOGGER
#  end
end
