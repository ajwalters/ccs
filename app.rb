require 'rubygems'
require 'sinatra'
require 'haml'

get '/' do
  "Hello, world #{params[:name]}".strip
end

__END__
@@ home
Hello, world!