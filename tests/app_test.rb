require 'app'
require "test/unit"
require 'rack/test'

set :environment, :test

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_says_hello_world
    get '/'
    assert last_response.ok?
    assert_equal 'Hello, world', last_response.body
  end

  def test_it_says_hello_to_a_person
    get '/', :name => "Penelope"
    assert last_response.body.include?('Penelope')
  end
end