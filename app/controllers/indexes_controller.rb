get '/' do
  erb :index
end

get '/search' do
  client = Yelp::Client.new({ consumer_key: ENV['CONSUMER_KEY'], consumer_secret: ENV['CONSUMER_SECRET'], token: ENV['TOKEN'], token_secret: ENV['TOKEN_SECRET']})
 p client.search(params[:zipcode], { term: params[:name], limit: 1 })
end

post '/search' do
  
end
