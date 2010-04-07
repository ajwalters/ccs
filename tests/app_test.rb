require 'app'
require "test/unit"
require 'rack/test'

set :environment, :test

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_shows_the_proposal_form do
    get '/'
    assert last_response.ok?

    assert last_response.body.include?('Calling all Chicago-land developers')
  end

end
