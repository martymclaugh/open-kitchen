get '/profile' do
  if logged_in?
  	erb :'users/profile'
  else
  	@login_error = "*You need to login first"
    erb :index
  end

end

get '/users/:user_id' do
	@user = User.find(params[:user_id])
	if @user == current_user
		redirect '/profile'
	else
		erb :'users/index'
	end
end
