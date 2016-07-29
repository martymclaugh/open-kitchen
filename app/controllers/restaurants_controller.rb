post '/restaurants' do
  @restaurant = Restaurant.find_by(address: params[:address])
  unless @restaurant
    @restaurant = Restaurant.create(params)
  end
  if request.xhr?
    erb :"restaurant/show", layout: false
  end
end

get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :"restaurant/show"
end

post '/restaurants/:id' do
  p "*" * 300
  p params
  @restaurant = Restaurant.find(params[:id])
    if request.xhr?
      erb :"restaurants/show"
    end
end

get '/restaurants/:id/customers' do
  @restaurant = Restaurant.find(params[:restaurant_id])
  if request.xhr?
    erb :"restaurant/customer_comments", layout: false
  end
end

get '/restaurants/:id/employees' do
  @restaurant = Restaurant.find(params[:restaurant_id])
  if request.xhr?
    erb :"restaurant/employee_comments", layout: false
  end
end

post '/restaurants/:id/reviews/' do
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.new(user_id: current_user.id, restaurant_id: params[:restaurant_id], title: params[:title], content: params[:content], value: params[:value])
  if @review.save
    @review
    if request.xhr?
      erb :"restaurant/_review",{ layout: false, locals: { review: @review }}
    end
  end
end
