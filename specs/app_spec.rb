require '../app'
require 'spec'
require 'rack/test'

set :environment, :test

describe "The App App" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end


  it "says hello" do
    get '/'
    last_response.should be_ok
    last_response.body.should == 'Hello, world'
  end
end
