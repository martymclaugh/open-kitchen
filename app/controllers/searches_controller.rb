post '/search' do
  client = Yelp::Client.new({ consumer_key: ENV['CONSUMER_KEY'], consumer_secret: ENV['CONSUMER_SECRET'], token: ENV['TOKEN'], token_secret: ENV['TOKEN_SECRET']})
  search = client.search(params[:zipcode], { term: params[:name], limit: 1 })
  # @restaurant = Restaurant.where(address: search.businesses.first.location.address.first)
  if request.xhr?
    content_type :json
    # binding.pry
    data = search.to_json
  end
end

get '/search' do
  if request.xhr?
    erb :search
  end
end
