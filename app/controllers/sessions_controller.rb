post '/register' do
  if params[:password1] == params[:password2]
    user = User.create(username: params[:username], full_name: params[:full_name], email: params[:email], password: params[:password2])
    if user
      redirect '/'
    end
  else
    @register_error = "*Passwords don't match"
    p @register_error
    erb :index
  end
end

get '/logout' do
  logout
  redirect '/'
end

post '/login' do
  user = User.authenticate(params[:username], params[:password])

  if user
    login(user)
    redirect '/'
  else
    @login_error = "*Wrong username or password"
    @login_error
    redirect '/'
  end
end
