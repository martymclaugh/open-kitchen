get '/profile' do
  if logged_in?
  	erb :'users/profile'
  else
  	@login_error = "*You need to login first"
    erb :index
  end

end

get '/users/:id' do
	@user = User.find(params[:id])
  if request.xhr?
	   erb :'users/_index'
  else
    erb :'users/_index'
  end
end

post '/users/:id' do
  @user = User.find(params[:user_id])
    if request.xhr?
      erb :"users/_index"
    end
end
