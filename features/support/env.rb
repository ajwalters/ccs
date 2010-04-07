gem 'mechanize', '=0.9.0'

require 'webrat'

# Webrat/Mechanize
Webrat.configure do |config|
  config.mode = :mechanize
end

World(Webrat::Methods)
World(Webrat::Matchers)

