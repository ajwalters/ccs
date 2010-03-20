require 'app'

#log = File.new('logs\sinatra.log', "a+")
#$stdout.reopen(log)
#$stderr.reopen(log)

run Sinatra::Application
