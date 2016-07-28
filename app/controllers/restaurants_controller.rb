post '/restaurants' do
  @restaurant = Restaurant.find_or_create_by(address: params[:address])
  if request.xhr?
    erb :"restaurant/show", layout: false
  end
end

get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :"restaurant/show"
end

get '/restaurants/:id/customers' do
  p params
  p "*" * 100
  @restaurant = Restaurant.find(params[:restaurant_id])
  if request.xhr?
    erb :"restaurant/customer_comments", layout: false
  end
end

get '/restaurants/:id/employees' do
  p params
  p "*" * 100
  @restaurant = Restaurant.find(params[:restaurant_id])
  if request.xhr?
    erb :"restaurant/employee_comments", layout: false
  end
end

post '/restaurants/:id/reviews/' do
  p "it out"
  p current_user
  p params
  @restaurant = Restaurant.find(params[:restaurant_id])
  @review = Review.create(user_id: current_user.id, restaurant_id: params[:restaurant_id], title: params[:title], content: params[:content], value: params[:value])
  if @review.save
    if request.xhr?
      erb :"restaurant/show",{ layout: false, locals: { review: @review }}
    end
  end
end
