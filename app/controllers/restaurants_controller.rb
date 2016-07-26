post '/restaurants/new' do
  restaurant = Restaurant.new(params)
  if request.xhr?
    content_type :json
    data = restaurant.to_json
end
