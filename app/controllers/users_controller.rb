get '/profile' do
  if logged_in?
  	erb :'users/profile'
  else
  	@login_error = "*You need to login first"
    erb :index
  end

end

get '/users/:user_id' do
  p "*" *500
	@user = User.find(params[:user_id])
  # if request.xhr?
	   erb :'users/_index'
  # end
end

post '/users/:user_id' do
  p params
  p "*" *500
  @user = User.find(params[:user_id])
 p @user
    if request.xhr?
      erb :"users/_index",{ layout: false, locals: { user: @review }}
    end
end
