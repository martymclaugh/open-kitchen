post '/restaurants' do
  @restaurant = Restaurant.find_or_create_by(params)
  if request.xhr?
    erb :"restaurant/show", layout: false
  end
end

get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :"restaurant/show"
end

get '/restaurants/:id/customers' do
  @restaurant = Restaurant.find(params[:id])
  erb :"restaurant/customers"
end

get '/restaurants/:id/employees' do
  @restaurant = Restaurant.find(params[:id])
  erb :"restaurant/employees"
end
