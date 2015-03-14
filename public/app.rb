require 'sinatra'
require 'json'

Dir[File.expand_path('../../lib', __FILE__) + "/*.rb"].each do |lib|
  require lib if lib !~ /test/
end

# ++
# routers
# ++
get '/' do
  'hello, welcome'
end

post '/text' do
 text = JSON.parse(request.body.read)['text']
 EmotionAnalyzer.on(text: text).to_json
end

post '/file' do
  text = request.body.string.strip
  EmotionAnalyzer.on(text: text).to_json
end

post '/url' do
  url = JSON.parse(request.body.read)['url']
  EmotionAnalyzer.on(url: url).to_json
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
