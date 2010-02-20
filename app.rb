require 'rubygems'
require 'sinatra'
require 'haml'

get '/' do
  :home
end

__END__
@@ home
Hello, world!