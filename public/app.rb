require 'sinatra'
require 'json'

# ++
# routers
# ++
get '/' do
  'hello, welcome'
end

post '/text' do
  'you are analyzing a text'
end


post '/file' do
  'you are upload a file'
end

post '/url' do
  'you are giving a url'
end

# ++
# otherwise
# ++
get '/*' do
  'dangerious zone, get out of here'
end

post '/*' do
  'dangerious zone, get out of here'
end
